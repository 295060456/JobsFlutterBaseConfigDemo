#!/bin/zsh

# ✅ 日志与输出函数（注意：这些输出走 stdout，仅用于展示，不参与命令替换）
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
warm_echo()      { log "\033[1;33m$1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
err_echo()       { log "\033[1;31m$1\033[0m"; }
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }
underline_echo() { log "\033[4m$1\033[0m"; }

# ✅ 参数默认值
DURATION=""          # 定时模式秒数；为空则可选交互模式
INTERACTIVE=false    # 交互模式（回车停止）
SIZE=""              # 例如 1080x1920；空=自动检测
BITRATE="8000000"    # 8Mbps
OUTPUT_DIR=""        # 输出目录；空=交互（回车=桌面）
SERIAL=""            # 指定设备序列号
SEG_LIMIT=180        # screenrecord 单段上限（秒）
MERGE_AFTER=false    # 定时分段是否合并

# ✅ 使用说明（展示用，走 stdout）
usage() {
  cat <<EOF
用法: $0 [选项]
  -d <seconds>    定时录制时长（秒）。>180 自动分段
  -i              交互模式：开始后按回车立即停止，并显示计时
  -s <WxH>        分辨率，如 1080x1920；留空自动检测
  -b <bitrate>    码率，默认 8000000（8Mbps）
  -o <dir>        输出目录；不提供将提示输入（回车=桌面）
  -S <serial>     指定设备序列号；不提供则用 fzf 选择
  -m              定时模式分段后自动用 ffmpeg 合并
  -h              显示帮助
EOF
}

# ✅ 字符清洗（纯函数，stdout 仅返回值）
strip_crlf() { printf "%s" "$1" | tr -d '\r\n'; }

# ✅ 参数解析（展示用日志走 stdout，不影响命令替换）
parse_args() {
  while getopts ":d:is:b:o:S:mh" opt; do
    case $opt in
      d) DURATION="$OPTARG" ;;
      i) INTERACTIVE=true ;;
      s) SIZE="$OPTARG" ;;
      b) BITRATE="$OPTARG" ;;
      o) OUTPUT_DIR="$OPTARG" ;;
      S) SERIAL="$OPTARG" ;;
      m) MERGE_AFTER=true ;;
      h) usage; exit 0 ;;
      \?) error_echo "未知参数: -$OPTARG"; usage; exit 2 ;;
      :) error_echo "参数 -$OPTARG 需要值"; usage; exit 2 ;;
    esac
  done
}

# ✅ 依赖检查
require_cmd() { if ! command -v "$1" >/dev/null 2>&1; then error_echo "未找到命令：$1"; exit 1; fi; }
check_requirements() {
  require_cmd adb
  if ! command -v fzf >/dev/null 2>&1; then warn_echo "未找到 fzf，将在多设备时使用首个设备。建议：brew install fzf"; fi
  if $MERGE_AFTER; then require_cmd ffmpeg; fi
}

# ✅ 设备选择（stdout 只输出 serial；其余提示走 stderr 或由外层打印）
pick_device() {
  if [[ -n "$SERIAL" ]]; then
    printf "%s" "$SERIAL"
    return
  fi
  local list count
  list=$(adb devices | awk 'NR>1 && $2=="device"{print $1}')
  count=$(echo "$list" | wc -l | tr -d ' ')
  if [[ "$count" -eq 0 ]]; then
    echo >&2 "✖ 未发现在线设备/模拟器，请先启动 Android 模拟器。"
    exit 1
  fi
  if [[ "$count" -eq 1 ]] || ! command -v fzf >/dev/null 2>&1; then
    printf "%s" "$(echo "$list" | head -n1)"
    return
  fi
  printf "%s" "$(echo "$list" | fzf --prompt="选择设备> " --height=40% --reverse)"
}

# ✅ 清理路径（stdout 只输出路径）
sanitize_path() {
  local p="$1"
  p=${p//$'\r'/}; p=${p//$'\n'/}; p=${p/#file:\/\//}; p=${p//\\ / }; p=${p%/}
  p=${p#\'}; p=${p%\'}
  p=${p#\"}; p=${p%\"}
  printf "%s" "$p"
}

# ✅ 输出目录提示（提示走 stderr；stdout 只输出路径）
prompt_output_dir() {
  if [[ -n "$OUTPUT_DIR" ]]; then
    printf "%s" "$(sanitize_path "$OUTPUT_DIR")"
    return
  fi
  echo >&2
  echo >&2 "📁 将保存目录【拖入此窗口】或回车用桌面："
  local input
  IFS= read -r input
  if [[ -z "$input" ]]; then
    printf "%s" "$HOME/Desktop"
  else
    printf "%s" "$(sanitize_path "$input")"
  fi
}

# ✅ 自动检测分辨率（stdout 只输出尺寸）
detect_size() {
  local s="$1"
  local res
  res=$(adb -s "$s" shell wm size 2>/dev/null | tr -d '\r' | awk -F': ' '/Physical size:/ {print $2}')
  [[ -z "$res" ]] && { printf "%s" "1080x1920"; return; }
  printf "%s" "$res"
}

# ✅ 向上取整（纯函数）
ceil_div() { local a=$1 b=$2; echo $(( (a + b - 1) / b )); }

# ✅ 单段录制（定时模式，用 --time-limit）
record_one_timed() {
  local serial="$1" time_limit_raw="$2" size="$3" bitrate="$4" local_path_raw="$5"
  local time_limit local_path
  time_limit="$(strip_crlf "$time_limit_raw")"
  local_path="$(strip_crlf "$local_path_raw")"
  info_echo "开始录制：${time_limit}s，分辨率=${size}，码率=${bitrate} → $local_path"
  adb -s "$serial" shell rm -f "/sdcard/tmp_record.mp4" >/dev/null 2>&1 || true
  adb -s "$serial" shell -- screenrecord \
    --time-limit "$time_limit" \
    --size "$size" \
    --bit-rate "$bitrate" \
    /sdcard/tmp_record.mp4
  info_echo "导出文件..."
  adb -s "$serial" pull /sdcard/tmp_record.mp4 "$local_path" >/dev/null
  adb -s "$serial" shell rm -f /sdcard/tmp_record.mp4 >/dev/null 2>&1 || true
  success_echo "保存：$local_path"
}

# ✅ 单段录制（交互模式：回车停止 + 实时计时）
record_one_interactive() {
  local serial="$1" size="$2" bitrate="$3" local_path_raw="$4"
  local local_path; local_path="$(strip_crlf "$local_path_raw")"
  info_echo "开始录制（按回车即可停止） → $local_path"
  adb -s "$serial" shell rm -f "/sdcard/tmp_record.mp4" >/dev/null 2>&1 || true
  adb -s "$serial" shell -- screenrecord \
    --size "$size" \
    --bit-rate "$bitrate" \
    /sdcard/tmp_record.mp4 &
  local rec_pid=$!

  local start_time=$(date +%s)
  {
    while kill -0 $rec_pid 2>/dev/null; do
      local now=$(date +%s)
      local elapsed=$((now - start_time))
      printf "\r⏱ 已录制：%3d 秒  按回车停止..." "$elapsed" >&2
      sleep 1
    done
  } &
  local timer_pid=$!

  IFS= read -r  # 回车停止
  kill $rec_pid 2>/dev/null
  wait $rec_pid 2>/dev/null
  kill $timer_pid 2>/dev/null
  wait $timer_pid 2>/dev/null
  echo >&2 ""  # 换行（stderr）

  info_echo "导出文件..."
  adb -s "$serial" pull /sdcard/tmp_record.mp4 "$local_path" >/dev/null
  adb -s "$serial" shell rm -f /sdcard/tmp_record.mp4 >/dev/null 2>&1 || true
  success_echo "保存：$local_path"
}

# ✅ 选择时长或进入交互模式（提示走 stderr，设置全局变量，不返回）
read_or_choose_mode() {
  if $INTERACTIVE; then
    typeset -g DURATION=""
    return
  fi
  echo >&2
  local d=""
  echo >&2 "⏱ 录制时长（秒；直接回车=进入交互模式）："
  IFS= read -r d
  d=$(printf "%s" "${d:-}" | tr -d '\r\n\t ')
  if [[ -z "$d" ]]; then
    typeset -g INTERACTIVE=true
    typeset -g DURATION=""
    return
  fi
  if ! [[ "$d" =~ ^[0-9]+$ ]]; then
    echo >&2 "✖ 时长必须是数字秒数。"
    exit 2
  fi
  typeset -g INTERACTIVE=false
  typeset -g DURATION="$d"
}

# ✅ 执行录制（定时/交互 + 合并；内部提示走 stdout，返回值通过参数）
do_record() {
  local serial="$1" output_dir_raw="$2" size="$3" duration_raw="$4"
  local output_dir duration ts outfile files=()
  output_dir="$(sanitize_path "$output_dir_raw")"
  duration="$(strip_crlf "$duration_raw")"
  mkdir -p "$output_dir"

  if $INTERACTIVE; then
    ts="$(date +%Y%m%d_%H%M%S)"
    printf -v outfile "%s/emulator_%s_interactive.mp4" "$output_dir" "$ts"
    record_one_interactive "$serial" "$size" "$BITRATE" "$outfile"
    files+=("$outfile")
  else
    if (( duration <= SEG_LIMIT )); then
      ts="$(date +%Y%m%d_%H%M%S)"
      printf -v outfile "%s/emulator_%s_%ss.mp4" "$output_dir" "$ts" "$duration"
      record_one_timed "$serial" "$duration" "$size" "$BITRATE" "$outfile"
      files+=("$outfile")
    else
      warn_echo "时长 $duration 秒 > ${SEG_LIMIT} 秒，自动分段"
      local segments remain this_len i
      segments=$(ceil_div "$duration" "$SEG_LIMIT")
      remain="$duration"; i=1
      while (( i <= segments )); do
        this_len=$(( remain > SEG_LIMIT ? SEG_LIMIT : remain ))
        ts="$(date +%Y%m%d_%H%M%S)"
        printf -v outfile "%s/emulator_%s_part%d_of_%d_%ss.mp4" \
          "$output_dir" "$ts" "$i" "$segments" "$this_len"
        record_one_timed "$serial" "$this_len" "$size" "$BITRATE" "$outfile"
        files+=("$outfile")
        remain=$(( remain - this_len ))
        (( i++ ))
      done
    fi

    if $MERGE_AFTER && ((${#files[@]} > 1)); then
      info_echo "开始合并 ${#files[@]} 个分段..."
      local list_file="$output_dir/files.txt"
      : > "$list_file"
      for f in "${files[@]}"; do
        printf "file '%s'\n" "$(basename "$f")" >> "$list_file"
      done
      (cd "$output_dir" && ffmpeg -f concat -safe 0 -i files.txt -c copy "emulator_merged.mp4")
      success_echo "合并完成：$output_dir/emulator_merged.mp4"
      # 如需删除分段文件与 files.txt：rm -f "${files[@]}" "$list_file"
    fi
  fi
}

# ✅ 主流程
main() {
  highlight_echo "Android 模拟器录屏 | 定时/交互 / fzf 选择 / 拖拽目录 / 分段与合并"

  # ✅ 解析参数与依赖检查
  parse_args "$@"
  check_requirements

  # ✅ 选择设备（pick_device 的 stdout 仅 serial；展示由这里打印）
  serial=$(pick_device)
  info_echo "选择设备：$serial"

  # ✅ 确定输出目录（prompt_output_dir 的 stdout 仅路径）
  output_dir=$(prompt_output_dir)
  success_echo "输出目录：$output_dir"

  # ✅ 获取分辨率（detect_size 的 stdout 仅尺寸）
  if [[ -z "$SIZE" ]]; then
    size=$(detect_size "$serial")
  else
    size="$SIZE"
  fi
  success_echo "使用分辨率：$size"

  # ✅ 选择模式：-i 交互；否则询问时长（提示走 stderr，更新全局变量）
  if [[ -n "$DURATION" && "$DURATION" =~ ^[0-9]+$ ]]; then
    INTERACTIVE=false
  else
    read_or_choose_mode
  fi

  # ✅ 执行录制（交互或定时；合并在定时模式生效）
  do_record "$serial" "$output_dir" "$size" "$DURATION"

  # ✅ 完成提示
  success_echo "全部完成 ✅"
}

main "$@"
