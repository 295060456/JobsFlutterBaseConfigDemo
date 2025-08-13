#!/bin/zsh
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# ========= ✅ AppleScript 注入路径：用于双击执行时正确获取路径 =========
for_path() {
    if [[ -z "$SCRIPT_FROM_APPLESCRIPT" ]]; then
      SCRIPT_PATH="$(osascript -e 'tell application \"Finder\" to set p to POSIX path of (target of window 1 as alias)' 2>/dev/null)"
      if [[ -n "$SCRIPT_PATH" ]]; then
        export SCRIPT_FROM_APPLESCRIPT="$SCRIPT_PATH"
        cd "$SCRIPT_FROM_APPLESCRIPT" || exit 1
        exec "$SCRIPT_FROM_APPLESCRIPT/$(basename "$0")"
      fi
    fi
}

# ========= 🌈 彩色输出 =========
print_colored() {
  case "$1" in
    green) color="32" ;; red) color="31" ;; yellow) color="33" ;; blue) color="34" ;; *) color="0" ;;
  esac
  shift
  echo "\033[${color}m$*\033[0m"
}
print_success() { print_colored green "✅ $*"; }
print_error()   { print_colored red   "❌ $*"; }
print_warn()    { print_colored yellow "⚠️ $*"; }
print_info()    { print_colored blue  "$*"; }

# ========= 📢 简介 =========
print_intro() {
  echo ""
  echo "=============================================="
  echo "🚀 JSON Server 快速启动器（自动生成 server.js）"
  echo "=============================================="
  echo "1️⃣ 自动检测并安装 npm、json-server、fzf（本地+全局）"
  echo "2️⃣ 支持选择 JSON 数据文件（拖入或扫描）"
  echo "3️⃣ 自动生成 config.js（含端口与路径）"
  echo "4️⃣ 自动生成 server.js，支持 POST 接口"
  echo "5️⃣ 智能检测端口占用并自动选择"
  echo "6️⃣ 支持前台调试 / 后台运行"
  echo "=============================================="
  echo ""
  read "tmp?👉 按下回车继续执行，或 Ctrl+C 退出..."
}

# ========= 📁 获取当前路径 =========
get_current_directory() {
  # 获取当前脚本自身真实路径（支持 Zsh / Bash / 双击 / 软链）
  local source="${(%):-%N}" # ✅ Zsh：当前脚本路径（%N 是 Zsh 的内置变量）
  if [[ -z "$source" || "$source" == "zsh" ]]; then
    source="$0"  # Fallback：用 $0
  fi

  if [[ "$source" != /* ]]; then
    source="$PWD/$source"  # 转成绝对路径
  fi

  export script_dir="$(cd "$(dirname "$source")" && pwd -P)"
  print_info "📁 当前脚本路径为：$script_dir"
  cd "$script_dir" || exit 1
}


# ========= 🧪 Homebrew =========
check_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    print_error "未安装 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    print_success "Homebrew 已安装"
  fi
}

# ========= 🧪 npm =========
check_npm() {
  if ! command -v npm >/dev/null 2>&1; then
    print_error "未检测到 npm，正在通过 brew 安装 Node.js..."
    brew install node
  else
    print_success "npm 已安装"
  fi
}

# ========= 🧪 json-server（全局+本地）=========
check_json_server() {
  # 全局
  if ! command -v json-server >/dev/null 2>&1; then
    print_warn "🌐 未检测到全局 json-server，正在安装..."
    npm install -g json-server
  else
    print_info "🌐 全局 json-server 已安装，检查版本..."
    latest=$(npm show json-server version)
    current=$(npm list -g json-server --depth=0 2>/dev/null | grep json-server | awk -F@ '{print $2}')
    if [[ "$latest" != "$current" ]]; then
      print_warn "🌐 更新 json-server：$current → $latest"
      npm install -g json-server@latest
    else
      print_success "🌐 全局 json-server 已是最新版本：$current"
    fi
  fi

  # 本地
  if [[ ! -f "node_modules/json-server/package.json" ]]; then
    print_warn "📦 当前项目未安装本地 json-server，正在安装..."
    npm install json-server --save
    print_success "📦 本地 json-server 安装完成"
  else
    print_success "📦 本地 json-server 已存在"
  fi
}

# ========= 🧪 fzf =========
check_fzf() {
  if ! command -v fzf >/dev/null 2>&1; then
    print_error "未检测到 fzf，正在安装..."
    brew install fzf
  else
    print_success "fzf 已安装"
  fi
}

# ========= 🔍 端口检测 =========
find_available_port() {
  port=3000
  while lsof -i tcp:$port >/dev/null 2>&1; do
    print_warn "端口 $port 被占用，尝试下一个..."
    port=$((port + 1))
  done
  echo "$port"
}

# ========= 🛠️ 自动生成 server.js =========
generate_server_js_if_needed() {
  if [[ ! -f "server.js" ]]; then
    cat > server.js <<'EOF'
#!/usr/bin/env node
const path = require('path')
const jsonServer = require('json-server')
const server = jsonServer.create()

// ✅ 使用绝对路径确保 JSON 文件可正确读取
const config = require('./config.js')
const dbPath = path.resolve(__dirname, config.JSON_PATH)
const router = jsonServer.router(dbPath)

const middlewares = jsonServer.defaults()
server.use(middlewares)
server.use(jsonServer.bodyParser)

// ✅ 示例 POST 接口
server.post('/getPosts', (req, res) => {
  const db = router.db
  const posts = db.get('posts').value()
  res.jsonp(posts)
})

server.use(router)

const port = config.JSON_SERVER_PORT
server.listen(port, () => {
  console.log('🚀 JSON Server is running at http://localhost:' + port)
})
EOF
    chmod +x server.js
    print_success "已自动生成 server.js（带接口）"
  else
    print_info "📄 已存在 server.js，跳过生成"
  fi
}

# ========= 📥 选择 JSON 文件 =========
select_json_file() {
  echo ""
  echo "📥 请拖入 .json 文件或目录，然后按回车（直接回车将扫描当前目录 JSONs 文件夹）："
  read -r input_path
  input_path="${input_path//\"/}" # 去除路径中的引号

  print_info "📂 输入路径为：${input_path:-<回车未输入，尝试使用 \$script_dir/JSONs>}"

  if [[ -n "$input_path" ]]; then
    if [[ -f "$input_path" && "$input_path" == *.json ]]; then
      selected_file="$input_path"
    elif [[ -d "$input_path" ]]; then
      json_files=($(find "$input_path" -type f -name "*.json" 2>/dev/null))
      if [ ${#json_files[@]} -eq 0 ]; then
        print_error "❌ 所选文件夹下未找到 .json 文件"
        exit 1
      fi
      selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
    else
      print_error "❌ 无效路径：不是 .json 文件或文件夹"
      exit 1
    fi
  else
    # ✅ 脚本目录/JSONs
    jsons_dir="${script_dir}/JSONs"
    if [[ ! -d "$jsons_dir" ]]; then
      print_error "❌ 未找到 JSONs 文件夹：$jsons_dir"
      exit 1
    fi

    json_files=($(find "$jsons_dir" -type f -name "*.json" 2>/dev/null))
    if [ ${#json_files[@]} -eq 0 ]; then
      print_error "❌ JSONs 文件夹中未找到任何 .json 文件"
      exit 1
    fi

    selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
  fi

  if [ -z "$selected_file" ]; then
    print_warn "⚠️ 未选择任何文件"
    exit 0
  fi

  print_success "✅ 您选择了: $selected_file"

  selected_port=$(find_available_port)
  echo "const JSON_SERVER_PORT = $selected_port;" > config.js
  echo "const JSON_PATH = '$selected_file';" >> config.js
  echo "module.exports = { JSON_SERVER_PORT, JSON_PATH };" >> config.js
  print_success "✅ 已生成 config.js（端口 + JSON 路径）"

  generate_server_js_if_needed

  echo ""
  read "run_mode?👉 按下回车后台运行（推荐），输入任意字符再回车则前台运行："

  if [[ -z "$run_mode" ]]; then
    node server.js > /dev/null 2>&1 &
    print_success "✅ 已在后台运行 server.js（PID $!）"
    sleep 1
    open "http://localhost:$selected_port/"
    print_info "👋 如需停止服务，请手动 kill $!"
  else
    print_info "🔍 前台模式运行中，按 Ctrl+C 停止服务"
    sleep 1
    open "http://localhost:$selected_port/"
    node server.js
  fi
}

# ========= 🔁 主流程 =========
main() {
  for_path
  print_intro
  get_current_directory
  check_brew
  check_npm
  check_json_server
  check_fzf
  select_json_file
  print_info "🎉 脚本执行完成"
}

main
