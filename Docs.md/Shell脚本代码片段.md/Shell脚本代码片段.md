# `Shell`脚本代码片段

[toc]

## 一、🎯 <font id=目的>**目的**</font>

* 虽然**Shell**脚本晦涩难懂，但相较于**python**等脚本，因为减少了一层系统封装调用，所以使得**shell**脚本具有更大的普适度

  * 不会因为第三方**Api**更新而影响使用
  * 也降低了某些潜在的兼容性等**Bug**的出现几率
  * 增强了代码执行的效率

* 为了更好的规避**Shell**脚本的晦涩难懂，特此文件记录一些高频需求涉及到的**Shell**脚本代码片段

* <font color=red>本文件下所有的**Shell**脚本都将使用`#!/bin/zsh`语法</font>

  | 特性                           | `#!/bin/zsh`（推荐）          | `#!/bin/sh`（兼容） |
  | ------------------------------ | ----------------------------- | ------------------- |
  | 默认交互功能（补全、高亮等）   | ✅ 强                          | ❌ 弱                |
  | 支持数组                       | ✅ 原生支持                    | ❌ 基本不支持        |
  | 字符串处理能力强               | ✅ 强大（支持正则/替换）       | ❌ 弱                |
  | 支持关联数组（字典）           | ✅ 支持                        | ❌ 不支持            |
  | 脚本调试支持                   | ✅ `set -x` + `zsh -x`         | ✅ `sh -x`           |
  | 更好的语法扩展（例如 `[[ ]]`） | ✅ 支持                        | ❌ 不支持            |
  | 更现代更安全的语法             | ✅ 是                          | ❌ 否                |
  | **macOS** 默认支持             | ✅ 是（**Catalina** 之后默认） | ✅ 是                |

## 二、💥 代码讲解 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

### 🎯 **Logo** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

* ```shell
  print_logo() {
    info "======================="
    info "     Jobs Installer    "
    info "======================="
  }
  ```

* ```shell
  print_description() {
    echo ""
    color_echo "||=================================================||"
    color_echo "||  JJJJJJJJ     oooooo    bb          SSSSSSSSSS  ||"
    color_echo "||        JJ    oo    oo   bb          SS      SS  ||"
    color_echo "||        JJ    oo    oo   bb          SS          ||"
    color_echo "||        JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS  ||"
    color_echo "||  J     JJ    oo    oo   bb      bb          SS  ||"
    color_echo "||  JJ    JJ    oo    oo   bb      bb  SS      SS  ||"
    color_echo "||   JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS  ||"
    color_echo "||=================================================||"
    echo ""
  }
  ```

### 🎯 🖨️打印输出彩色函数 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

* ```shell
  # ============================= 日志输出函数 =============================
  # 默认日志文件路径（可被外部覆盖）
  LOG_FILE="${LOG_FILE:-/tmp/script_log.txt}"
  # 通用日志输出（含日志落盘）
  log() {
    local msg="$1"
    echo -e "$msg" | tee -a "$LOG_FILE"
  }
  
  # --------------------------- 各类语义输出 ---------------------------
  info()        { log "\033[1;34mℹ $1\033[0m"; }     # ℹ 信息（蓝）
  success()     { log "\033[1;32m✔ $1\033[0m"; }     # ✔ 成功（绿）
  warn()        { log "\033[1;33m⚠ $1\033[0m"; }     # ⚠ 警告（黄）
  error()       { log "\033[1;31m✖ $1\033[0m"; }     # ✖ 错误（红）
  debug()       { log "\033[1;35m🐞 $1\033[0m"; }     # 🐞 调试（紫）
  note()        { log "\033[1;36m➤ $1\033[0m"; }     # ➤ 提示（青）
  highlight()   { log "\033[1;36m🔹 $1\033[0m"; }     # 🔹 高亮（青）
  bold()        { log "\033[1m$1\033[0m"; }          # 📝 加粗
  gray()        { log "\033[0;90m$1\033[0m"; }       # ⚫ 灰色（弱提示）
  underline()   { log "\033[4m$1\033[0m"; }          # 🔗 下划线
  
  # ✅ 示例用法
  # success "安装成功"
  # warn "即将覆盖文件"
  # error "安装失败"
  # debug "路径为 $HOME/bin"
  # note "下一步执行 flutter build"
  # bold "重要步骤"
  ```

* ```shell
  SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
  LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径
  
  log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
  color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
  info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
  success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
  warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
  warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
  note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
  error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
  err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
  debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
  highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
  gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
  bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
  underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线
  
  # ✅ 示例用法
  # success_echo "安装成功"
  # error_echo "安装失败"
  # info_echo "开始执行脚本..."
  # warn_echo "检测到风险配置"
  # note_echo "请注意版本兼容性"
  # debug_echo "当前变量值：\$VAR=xxx"
  # highlight_echo "推荐使用该功能"
  # bold_echo "这是加粗文本"
  # underline_echo "点击链接查看详情"
  # gray_echo "跳过无关文件"
  ```

* ```shell
  _color_echo() {
    local color="$1"; shift
    local text="$*"
  
    case "$color" in
      red)        printf "\033[31m%s\033[0m\n" "$text" ;;  # 错误 ❌
      green)      printf "\033[32m%s\033[0m\n" "$text" ;;  # 成功 ✅
      yellow)     printf "\033[33m%s\033[0m\n" "$text" ;;  # 警告 ⚠️
      blue)       printf "\033[34m%s\033[0m\n" "$text" ;;  # 信息 📘
      purple)     printf "\033[35m%s\033[0m\n" "$text" ;;  # 调试 🟣
      cyan)       printf "\033[36m%s\033[0m\n" "$text" ;;  # 辅助 💠
      white)      printf "\033[37m%s\033[0m\n" "$text" ;;  # 普通 ⚪
      gray)       printf "\033[90m%s\033[0m\n" "$text" ;;  # 次要信息 ⚫
  
      bold)       printf "\033[1m%s\033[0m\n" "$text" ;;   # 粗体
      underline)  printf "\033[4m%s\033[0m\n" "$text" ;;   # 下划线
  
      success)    printf "\033[1;32m✔ %s\033[0m\n" "$text" ;;
      error)      printf "\033[1;31m✖ %s\033[0m\n" "$text" ;;
      info)       printf "\033[1;34mℹ %s\033[0m\n" "$text" ;;
      warning)    printf "\033[1;33m⚠ %s\033[0m\n" "$text" ;;
      note)       printf "\033[1;35m➤ %s\033[0m\n" "$text" ;;
  
      *)          printf "%s\n" "$text" ;;  # 默认普通输出
    esac
  }
  
  # ✅ 示例用法
  # _color_echo red "❌ 出错了"
  # _color_echo green "✅ 成功完成任务"
  # _color_echo yellow "⚠️ 警告信息"
  # _color_echo blue "📘 蓝色提示"
  # _color_echo purple "🟣 紫色调试"
  # _color_echo cyan "💠 青色辅助"
  # _color_echo white "⚪ 普通白色输出"
  # _color_echo gray "⚫ 灰色信息"
  
  # _color_echo bold "📝 加粗文字"
  # _color_echo underline "🔗 下划线文字"
  
  # _color_echo success "✔ 操作成功（绿色 + 图标）"
  # _color_echo error "✖ 操作失败（红色 + 图标）"
  # _color_echo info "ℹ 信息提示（蓝色 + 图标）"
  # _color_echo warning "⚠ 注意风险（黄色 + 图标）"
  # _color_echo note "➤ 额外提示（紫色 + 图标）"
  ```

* ```shell
  _JobsPrint() {
    local COLOR="$1"
    local TEXT="$2"
    local RESET="\033[0m"
    echo "${COLOR}${TEXT}${RESET}"
  }
  
  _JobsPrint_Red()        { _JobsPrint "\033[1;31m" "$1"; }   # 🔴 红色（错误）
  _JobsPrint_Green()      { _JobsPrint "\033[1;32m" "$1"; }   # 🟢 绿色（成功）
  _JobsPrint_Yellow()     { _JobsPrint "\033[1;33m" "$1"; }   # 🟡 黄色（警告）
  _JobsPrint_Blue()       { _JobsPrint "\033[1;34m" "$1"; }   # 🔵 蓝色（信息）
  _JobsPrint_Purple()     { _JobsPrint "\033[1;35m" "$1"; }   # 🟣 紫色（调试）
  _JobsPrint_Cyan()       { _JobsPrint "\033[1;36m" "$1"; }   # 🔵 青色（辅助）
  _JobsPrint_White()      { _JobsPrint "\033[1;37m" "$1"; }   # ⚪ 白色（普通输出）
  _JobsPrint_Gray()       { _JobsPrint "\033[0;90m" "$1"; }   # ⚫ 灰色（次要信息）
  _JobsPrint_Bold()       { _JobsPrint "\033[1m"     "$1"; }   # 📝 粗体
  _JobsPrint_Underline()  { _JobsPrint "\033[4m"     "$1"; }   # 🔗 下划线
  
  # ✅ 示例用法
  # _JobsPrint_Red "❌ 安装失败"
  # _JobsPrint_Green "✅ 安装成功"
  # _JobsPrint_Yellow "⚠️ 请注意：配置存在风险"
  # _JobsPrint_Blue "📘 正在拉取远程资源..."
  # _JobsPrint_Purple "🟣 进入调试模式"
  # _JobsPrint_Cyan "🔵 正在初始化辅助模块..."
  # _JobsPrint_White "⚪ 普通提示：操作完成"
  # _JobsPrint_Gray "⚫ 跳过无关文件"
  # _JobsPrint_Bold "📝 加粗强调：重要内容"
  # _JobsPrint_Underline "🔗 文档地址：https://example.com"
  ```

### 🎯 打开系统设置 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open "x-apple.systempreferences:com.apple.preference.security?Privacy"
```

### 🎯 等待用户输入后执行 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

* ```shell
  read '?XXX 任意键=跳过： ' sim_input
  if [[ -z "$sim_input" ]]; then
    # 系统检测到用户输入回车，开始执行
  else
    # 系统检测到用户输入任意键
  fi
  ```

* ```shell
  echo ""
  read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."
  
  echo ""
  ```

* ```shell
  read -p "⚠️ 确定要卸载 XXX？请输入 yes 开始执行：" confirm
  
  if [[ "$confirm" != "yes" ]]; then
    echo "❎ 已取消卸载操作"
    exit 0
  fi
  
  echo "🧨 正在卸载 XXX..."
  ```

### 🎯 判断是否当前IP在中国🇨🇳（大陆地区）<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
is_in_china() {
  local country
  country=$(curl -s --max-time 3 https://ipinfo.io | jq -r '.country' 2>/dev/null)

  if [[ "$country" == "CN" ]]; then
    return 0  # 是中国，true
  else
    return 1  # 不是中国，false
  fi
}
```

### 🎯 获取系统变量 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 1、**获取：脚本所在目录的绝对路径**

  >`"$0"`：表示**当前脚本的相对路径或调用路径**
  >
  >`dirname "$0"`：提取出脚本所在的**目录路径**
  >
  >`cd "$(dirname "$0")"`：进入脚本所在的目录
  >
  >`pwd`：获取当前目录的**绝对路径**

  ```shell
  basedir=$(cd "$(dirname "$0")"; pwd -P)
  ```

#### 2、**获取：当前脚本文件名**

  > `basename "$0"`：提取脚本文件的**文件名**部分（去除路径）

  ```shell
  script_file="$(basename "$0")"
  ```

#### 3、**获取：桌面路径**

  ```shell
  DESKTOP_PATH=~/Desktop
  ```

#### 4、**获取：当前用户名**

  > 用双引号 `"` 包裹起来，可以防止用户名中出现空格、特殊字符时发生错误

  ```shell
  user="$USER" # 最强兼容性（大部分 shell 都默认支持）
  user="${USER:-$(whoami)}" # 最强健壮性：防止极端场景 $USER 为空
  ```

  ```shell
  user="$(whoami)"
  ```

  ```shell
  user="$(id -un)" 
  ```

  ```shell
  user="$(logname)" 
  ```

  | 表达式    | 类型     | 含义说明                                                 |
  | --------- | -------- | -------------------------------------------------------- |
  | `"$USER"` | 环境变量 | 当前 shell 会话中的用户名变量（快捷方式）                |
  | `whoami`  | 命令     | 实际正在运行当前 shell 进程的用户名                      |
  | `id -un`  | 命令     | 当前有效用户的用户名（与 `whoami` 通常一样，但更底层）   |
  | `logname` | 命令     | 最初登录系统的用户（在 `sudo` 场景下可能与当前用户不同） |

#### 5、**获取：🍏 Xcode 信息**

```shell
print_xcode_info() {
  highlight_echo "🍏 Xcode 信息"
  if command -v xcodebuild >/dev/null 2>&1; then
    info_echo "Xcode 版本：$(xcodebuild -version | head -n 1)"
    info_echo "Xcode 路径：$(xcode-select -p)"
  else
    error_echo "未检测到 xcodebuild"
  fi
}
```

#### 6、**获取：☕ Java 信息 **

```
print_java_info() {
  highlight_echo "☕ Java 环境"
  if command -v java >/dev/null 2>&1; then
    java -version 2>&1 | head -n 1
    info_echo "JAVA_HOME：${JAVA_HOME:-[未设置]}"
  else
    error_echo "未安装 Java"
  fi
}
```

#### 7、**获取：🤖 Android SDK 信息**

```shell
print_android_sdk_info() {
  highlight_echo "🤖 Android SDK"
  if [[ -n "$ANDROID_SDK_ROOT" ]]; then
    info_echo "ANDROID_SDK_ROOT：$ANDROID_SDK_ROOT"
    if [[ -d "$ANDROID_SDK_ROOT" ]]; then
      success_echo "SDK 目录存在"
      if [[ -f "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" ]]; then
        "$ANDROID_SDK_ROOT/tools/bin/sdkmanager" --version
      elif [[ -f "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" ]]; then
        "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --version
      else
        warn_echo "未找到 sdkmanager"
      fi
    else
      error_echo "ANDROID_SDK_ROOT 路径不存在"
    fi
  else
    warn_echo "未设置 ANDROID_SDK_ROOT 环境变量"
  fi
}
```





### 🎯 [**Flutter**](https://flutter.dev/) <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 🎯 1、判断当前目录是否为[**Flutter**](https://flutter.dev/)项目根目录 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
_is_flutter_project_root() {
  [[ -f "$1/pubspec.yaml" && -d "$1/lib" ]]
}
```

#### 🎯 2、获取 **Flutter** 项目名称  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
_get_flutter_project_name() {
  local root="$1"
  if _is_flutter_project_root "$root"; then
    flutter_project_name=$(grep -m1 '^name:' "$root/pubspec.yaml" | awk '{print $2}')
    [[ -z "$flutter_project_name" ]] && flutter_project_name="Flutter项目"
  else
    flutter_project_name="Flutter项目"
  fi
}
```

#### 🎯 3、判断[**Flutter**](https://flutter.dev/)文件是否是入口🚪 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> <font color=red>**支持的**`main`**函数写法**</font>
> `void main() {}`// 标准同步入口
> `void main() => runApp();`// 箭头函数写法
> `Future<void> main() async {}`// 异步入口函数
> `Future<void> main() => runApp(); `// 异步箭头写法
> `main() {}`// 无返回值声明的入口
> `main() async {}`// 无返回值 + 异步入口

```shell
_is_dart_entry_file() {
  local f="$1"
  local abs=$(_abs_path "$f") || return 1
  [[ $abs == *.dart ]] || return 1

  # ✅ 支持 main() {...} 和 main() => ... 写法
  if grep -Ev '^\s*//' "$abs" | grep -Eq '\b(Future\s*<\s*void\s*>|void)?\s*main\s*\(\s*\)\s*(async\s*)?(\{|=>)' ; then
    return 0
  fi
  return 1
}
```

```dart
detect_entry() {
  SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd -P)"
  SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"

  while true; do
    warn_echo "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径："
    read -r user_input
    user_input="${user_input//\"/}"
    user_input="${user_input%/}"

    if [[ -z "$user_input" ]]; then
      if is_flutter_project_root "$SCRIPT_DIR"; then
        flutter_root=$(abs_path "$SCRIPT_DIR")
        entry_file="$flutter_root/lib/main.dart"
        highlight_echo "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
        break
      else
        error_echo "❌ 当前目录不是 Flutter 项目根目录，请重新拖入。"
        continue
      fi
    fi

    if [[ -d "$user_input" ]]; then
      if is_flutter_project_root "$user_input"; then
        flutter_root=$(abs_path "$user_input")
        entry_file="$flutter_root/lib/main.dart"
        break
      fi
    elif [[ -f "$user_input" ]]; then
      if is_dart_entry_file "$user_input"; then
        entry_file=$(abs_path "$user_input")
        flutter_root="${entry_file:h}"
        break
      fi
    fi

    error_echo "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
  done

  cd "$flutter_root" || { error_echo "无法进入项目目录：$flutter_root"; exit 1; }
  success_echo "✅ 项目路径：$flutter_root"
  success_echo "🎯 入口文件：$entry_file"
}
```

#### 🎯 4、统一获取[**Flutter**](https://flutter.dev/)项目路径 和 **Dart** 入口文件路径 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> 兼容用户拖入目录、拖入 Dart 文件、或直接回车（默认为当前目录为[**Flutter**](https://flutter.dev/)项目根目录）三种用法

```shell
# ---------------------------------------------------------------------------
# 获取脚本自身绝对路径（用于桌面快捷方式）
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd -P)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"

# ---------------------------------------------------------------------------
# 入口识别：支持三种情况
#   A. 用户拖入路径（目录 / 文件）并回车
#   B. 用户直接回车（空输入）=> 若脚本所在目录是 Flutter 根目录则自动使用
#   C. 用户拖入 Dart 单文件
# ---------------------------------------------------------------------------
entry_file=""
flutter_root=""

while true; do
  _color_echo yellow "📂 请拖入 Flutter 项目根目录或 Dart 单文件路径："
  read -r user_input
  user_input="${user_input//\"/}"          # 去掉引号
  user_input="${user_input%/}"              # 去尾斜杠

  # 用户直接回车：尝试脚本所在目录
  if [[ -z "$user_input" ]]; then
    if _is_flutter_project_root "$SCRIPT_DIR"; then
      flutter_root=$(_abs_path "$SCRIPT_DIR")
      entry_file="$flutter_root/lib/main.dart"
      _color_echo cyan "🎯 检测到脚本所在目录即 Flutter 根目录，自动使用。"
      break
    else
      _color_echo red "❌ 未检测到有效路径（脚本目录不是 Flutter 根）。请重新拖入。"
      continue
    fi
  fi

  if [[ -d "$user_input" ]]; then
    if _is_flutter_project_root "$user_input"; then
      flutter_root=$(_abs_path "$user_input")
      entry_file="$flutter_root/lib/main.dart"
      break
    fi
  elif [[ -f "$user_input" ]]; then
    if _is_dart_entry_file "$user_input"; then
      entry_file=$(_abs_path "$user_input")
      flutter_root="${entry_file:h}"
      break
    fi
  fi

  _color_echo red "❌ 无效路径，请重新拖入 Flutter 根目录或 Dart 单文件。"
 done

cd "$flutter_root" || { _color_echo red "无法进入项目目录：$flutter_root"; exit 1; }
_color_echo green "✅ 项目路径：$flutter_root"
_color_echo green "🎯 入口文件：$entry_file"
```

#### 🎯 5、[**FVM**](https://fvm.app/) 检测 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
_detect_flutter_cmd() {
  if command -v fvm >/dev/null 2>&1 && [[ -f ".fvm/fvm_config.json" ]]; then
    flutter_cmd=("fvm" "flutter")
    info_echo "🧩 检测到 FVM 项目，使用命令：fvm flutter"
  else
    flutter_cmd=("flutter")
    info_echo "📦 使用系统 Flutter 命令：flutter"
  fi
}
```

```dart
read '?📦 执行 flutter pub get？(回车=执行 / 任意键=跳过) ' run_get
if [[ -z "$run_get" ]]; then
  "${flutter_cmd[@]}" pub get
else
  _color_echo yellow "⏭️ 跳过 pub get。"
fi
```

> 如果安装了[**FVM**](https://fvm.app/) ，则 `fvm flutter pub get`
>
> 如果没有安装[**FVM**](https://fvm.app/) ，则 `flutter pub get`

### 🎯 生成桌面快捷方式 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
shortcut_name="${flutter_project_name}.command"
shortcut_path="$HOME/Desktop/$shortcut_name"
if [[ ! -f "$shortcut_path" ]]; then
  ln -s "$script_path/$script_file" "$shortcut_path"
  chmod +x "$shortcut_path"
  echo "📎 已在桌面创建快捷方式：$shortcut_name"
fi
```

### 🎯 转换路径为<font color=red>**绝对路径**</font> <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> **将用户输入的路径（文件或文件夹）转换为“绝对路径（不含软链接）”**，并去掉多余的双引号或末尾斜杠，增强兼容性。

```shell
_abs_path() {
  local p="$1"
  [[ -z "$p" ]] && return 1
  # 去掉包裹双引号
  p="${p//\"/}"
  # 去掉末尾斜杠（不影响根 /）
  [[ "$p" != "/" ]] && p="${p%/}"
  if [[ -d "$p" ]]; then
    (cd "$p" 2>/dev/null && pwd -P)
  elif [[ -f "$p" ]]; then
    (cd "${p:h}" 2>/dev/null && printf "%s/%s\n" "$(pwd -P)" "${p:t}")
  else
    return 1
  fi
}
```

### 🎯 识别**`.xcodeproj`**  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
find_or_prompt_xcodeproj() {
  XCODEPROJ=$(find "$PROJECT_DIR" -maxdepth 1 -name "*.xcodeproj" | head -n 1)

  if [[ -z "$XCODEPROJ" ]]; then
    error_echo "❌ 未找到 .xcodeproj 文件，请手动拖入"
    read "?🔍 拖入 .xcodeproj 文件后回车：" XCODEPROJ
    XCODEPROJ=${XCODEPROJ%\"}
    XCODEPROJ=${XCODEPROJ#\"}
  fi

  PBXPROJ_PATH="$XCODEPROJ/project.pbxproj"
  if [[ ! -f "$PBXPROJ_PATH" ]]; then
    error_echo "❌ project.pbxproj 文件无效，脚本终止"
    exit 1
  fi
  info_echo "📂 当前工程：$XCODEPROJ"
}
```

### 🎯 **iOS** 模拟器📱<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 1、（检测）防止假后台  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> 如果是假后台：`xcrun simctl list devices | grep -E "Booted"` 控制台什么也不输出
> 如果真后台：`xcrun simctl list devices | grep -E "Booted"` 控制台会有输出

```shell
fix_fake_simulator() {
  warn_echo "🕵️ 检测模拟器是否处于假后台..."
  booted_check=$(xcrun simctl list devices | grep "(Booted)") # ✅ 使用 simctl 检查当前是否有已启动（Booted）状态的模拟器设备
  simulator_running=$(pgrep -f Simulator)                     # ✅ 检查是否存在 Simulator 应用的后台进程（即进程存在但可能界面未显示）
  
  # 🧠 如果没有任何 Booted 状态的设备，但检测到 Simulator 进程，说明是“假后台”
  if [[ -z "$booted_check" && -n "$simulator_running" ]]; then
    error_echo "❗️ 模拟器处于假后台状态，正在强制关闭..."
    xcrun simctl shutdown all >/dev/null 2>&1                 # 🧹 使用 simctl 关闭所有模拟器实例（防止残留）
    osascript -e 'quit app "Simulator"' >/dev/null 2>&1       # 🧼 使用 AppleScript 关闭 Simulator 应用（用于 GUI 层面的强制退出）
    pkill -f Simulator >/dev/null 2>&1                        # 🧯 最后保险措施：通过进程名强制终止 Simulator 进程
    success_echo "✅ 已强制关闭假后台模拟器。"
  else
    success_echo "✅ 模拟器状态正常，无需关闭。"
  fi
}
```

#### 2、📱关闭 **iOS** 模拟器   <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
xcrun simctl shutdown all
# 检查是否有iOS模拟器进程存在(存在即杀进程)
if pgrep -f 'Simulator' >/dev/null; then
    # 如果有，则会杀死所有包含"Simulator"字符串的进程
    pkill -f 'Simulator'
    echo "iOS模拟器进程已终止"
else
    echo "没有找到iOS模拟器进程"
fi
```

#### 3、📱打开 **iOS** 模拟器   <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open -a Simulator
```

### 🎯 执行耗时  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
START_TIME=$(date +%s) # 放在最前面
# 耗时操作...

print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  info "⚙️ 脚本总耗时：${DURATION}s"
}

print_duration
```

### 🎯 写文件 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 🎯 1、语法 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

* **追加写入**

  * 单行文件

    ```shell
    echo 'export PATH="$HOME/.pub-cache/bin:$PATH"' >> ~/.zshrc
    ```

  * 多行文件

    ```shell
    cat <<EOF >> ~/.zshrc
    
    # >>> Flutter 环境变量 >>>
    export PATH="\$HOME/.pub-cache/bin:\$PATH"
    
    EOF
    ```

* **覆盖写入**

  * 单行文件

    ```shell
    echo 'export PATH="$HOME/.pub-cache/bin:$PATH"' > ~/.zshrc
    ```

  * 多行文件

    ```shell
    cat <<EOF > ~/.zshrc
    
    # >>> Flutter 环境变量 >>>
    export PATH="\$HOME/.pub-cache/bin:\$PATH"
    
    EOF
    ```

#### 🎯 2、封装 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

##### 🎯 2.1、单行写文件（避免重复写入） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
inject_shellenv_block() {
    local id="$1"           # 参数1：环境变量块 ID，如 "homebrew_env"
    local shellenv="$2"     # 参数2：实际要写入的 shellenv 内容，如 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    local header="# >>> ${id} 环境变量 >>>"  # 自动生成注释头

    # 参数校验
    if [[ -z "$id" || -z "$shellenv" ]]; then
    error_echo "❌ 缺少参数：inject_shellenv_block <id> <shellenv>"
    return 1
    fi

    # 若用户未选择该 ID，则跳过写入
    if [[ ! " ${selected_envs[*]} " =~ " $id " ]]; then
    warn_echo "⏭️ 用户未选择写入环境：$id，跳过"
    return 0
    fi

    # 避免重复写入
    if grep -Fq "$header" "$PROFILE_FILE"; then
      info_echo "📌 已存在 header：$header"
    elif grep -Fq "$shellenv" "$PROFILE_FILE"; then
      info_echo "📌 已存在 shellenv：$shellenv"
    else
      echo "" >> "$PROFILE_FILE"
      echo "$header" >> "$PROFILE_FILE"
      echo "$shellenv" >> "$PROFILE_FILE"
      success_echo "✅ 已写入：$header"
    fi

    # 当前 shell 生效
    eval "$shellenv"
    success_echo "🟢 shellenv 已在当前终端生效"
}
```

##### 🎯 2.2、多行写文件（避免重复写入） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
append_env_block() {
  local file="$1"           # 参数1：要写入的文件路径，例如 ~/.zshrc
  shift                     # 去掉第一个参数
  local block=("$@")        # 参数2+：多行内容数组

  # 提取 block 中第一行作为 header（用作唯一标识）
  local header="${block[0]}"
  if [[ -z "$header" ]]; then
    error_echo "❌ 环境变量块不能为空"
    return 1
  fi

  # 如果文件中已包含该 header，跳过写入
  if grep -Fq "$header" "$file" 2>/dev/null; then
    info_echo "📌 已存在：$header"
  else
    echo "" >> "$file"
    for line in "${block[@]}"; do
      echo "$line" >> "$file"
    done
    success_echo "✅ 已写入到 $file：$header"
  fi
}
```

### 🎯 环境变量 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

| shell 类型 | 默认配置文件      | macOS 默认用哪个❓                                            |
| ---------- | ----------------- | ------------------------------------------------------------ |
| `bash`     | `~/.bash_profile` | **macOS Catalina（10.15）** 以前                             |
| `zsh`      | `~/.zprofile`     | ✅ **macOS Catalina（10.15）** 以后<font color=red>默认</font> |

```shell
# 写 Homebrew 的环境变量（区分架构）
arch=$(get_cpu_arch)

if [[ "$arch" == "arm64" ]]; then
  /// TODO
else
	/// TODO
fi
```

#### 🎯 1、写单行的环境变量 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
inject_shellenv_block "$HOME/.zprofile" 'eval "$(/opt/homebrew/bin/brew shellenv)"'
```

#### 🎯 2、写多行的环境变量 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
append_env_block "$HOME/.zshrc" \
  'export PATH="$HOME/fvm/default/bin:$PATH"' \
  'export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn'
```

#### 🎯 3、🌐 环境变量格式化 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

<font color=red>把环境变量 `$PATH` 中的路径项按冒号（`:`）拆分，并逐行打印每一项路径</font>

> `IFS=':'`：设置字段分隔符（Internal Field Separator）为 `:`；
>
> `read -ra PATH_PARTS`：
>
> - `-r`：表示不让反斜杠转义；
> - `-a PATH_PARTS`：把读取的结果保存到数组 `PATH_PARTS` 中；
>
> `<<< "$PATH"`：将 `$PATH` 的内容作为输入传给 `read`；

```shell
IFS=':' read -ra PATH_PARTS <<< "$PATH" # 等价于把 $PATH 按 : 拆成数组。
for p in "${PATH_PARTS[@]}"; do # 遍历数组 PATH_PARTS 中的每一项；
    echo "  $p" # 并在每一项前加两个空格打印出来。
done
```

```shell
/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin 

=>

/usr/local/bin
/opt/homebrew/bin
/usr/bin
/bin
```

### 🎯 使用**`fzf`**  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
fzf_select() {
  echo -e "$@" | tr ' ' '\n' | fzf --prompt="请选择安装方式：" --height=10 --border
}
```

> 基本用法👇
>
> ```shell
> result=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装" "取消")
> ```

### 🎯 判断芯片架构（`ARM64` / `x86_64`）<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}
```

### 🎯 自检安装 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 🎯 1、自检安装 🍺**`Homebrew`** （自动架构判断）<a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_homebrew() {
  local arch="$(get_cpu_arch)"                    # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}
```

```shell
# 写 Homebrew 的环境变量（区分架构）
arch=$(get_cpu_arch)

if [[ "$arch" == "arm64" ]]; then
  inject_shellenv_block "$HOME/.zprofile" 'eval "$(/opt/homebrew/bin/brew shellenv)"'
else
  inject_shellenv_block "$HOME/.bash_profile" 'eval "$(/usr/local/bin/brew shellenv)"'
fi
```

#### 🎯 2、自检安装 🍺**`Homebrew.fzf`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) err "❌ 取消安装 fzf";;
    esac
  else
    _color_echo blue "🔄 fzf 已安装，升级中..."
    brew upgrade fzf && brew cleanup
    _color_echo green "✅ fzf 已是最新版"
  fi
}
```

#### 🎯 3、自检安装 🍺**`Homebrew.jq`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_jq() {
  if ! command -v jq &>/dev/null; then
    note_echo "📦 未检测到 jq，正在通过 Homebrew 安装..."
    brew install jq || { error_echo "❌ jq 安装失败"; exit 1; }
    success_echo "✅ jq 安装成功"
  else
    info_echo "🔄 jq 已安装，升级中..."
    brew upgrade jq && brew cleanup
    success_echo "✅ jq 已是最新版"
  fi
}
```

#### 🎯 4、自检安装 🍺**`Homebrew.dart`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_dart() {
  if ! command -v dart &>/dev/null; then
    note_echo "📦 未检测到 dart，正在通过 Homebrew 安装..."
    brew tap dart-lang/dart
    brew install dart || { error_echo "❌ dart 安装失败"; exit 1; }
    success_echo "✅ dart 安装成功"
  else
    info_echo "🔄 dart 已安装，升级中..."
    brew upgrade dart && brew cleanup
    success_echo "✅ dart 已是最新版"
  fi
}
```

#### 🎯 5、自检安装 🍺**`Homebrew.coreutils`**（提供 `realpath`） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_coreutils() {
  if ! command -v realpath >/dev/null; then
    info "🔍 正在安装 coreutils（提供 realpath）"
    brew install coreutils
  else
    _color_echo blue "🔄 coreutils 已安装，升级中..."
    brew upgrade coreutils || true
    _color_echo green "✅ coreutils 已是最新版"
  fi
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
}
```

#### 🎯 6、自检安装 **`Ruby`**（fzf交互 + 多选项） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
install_ruby() {
  method=$(fzf_select "通过 Homebrew 安装 Ruby" "通过 Rbenv 安装 Ruby" "通过 RVM 安装 Ruby")
  case $method in
    *Homebrew*)
      brew install ruby
      echo 'export PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
      ;;
    *Rbenv*)
      brew install rbenv ruby-build
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
      eval "$(rbenv init -)"
      rbenv install 3.3.0
      rbenv global 3.3.0
      ;;
    *RVM*)
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      source ~/.rvm/scripts/rvm
      ;;
    *) err "❌ 未选择安装 Ruby";;
  esac
}
```

### 🎯 自检安装 **`fvm`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> <font color=red>**安装`fvm`一定要在安装了`dart`环境的大前提下才可以**</font>

```shell
install_fvm() {
  if ! command -v fvm &>/dev/null; then
    note_echo "📦 未检测到 fvm，正在通过 dart pub global 安装..."
    dart pub global activate fvm || { error_echo "❌ fvm 安装失败"; exit 1; }
    success_echo "✅ fvm 安装成功"
  else
    info_echo "🔄 fvm 已安装，正在升级..."
    dart pub global activate fvm
    success_echo "✅ fvm 已是最新版"
  fi
	fvm --version | tee -a "$LOG_FILE"
  # ✅ 自动注入 ~/.pub-cache/bin 到 PATH（用统一结构封装）
  inject_shellenv_block "fvm_env" 'export PATH="$HOME/.pub-cache/bin:$PATH"'
}
```

### 🎯 安装**`CocoaPods`**（`fzf`选择 `gem`/`Homebrew`） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```
install_cocoapods() {
  method=$(fzf_select "通过 gem 安装 CocoaPods" "通过 Homebrew 安装 CocoaPods")
  case $method in
    *gem*)
      sudo gem install cocoapods
      ;;
    *Homebrew*)
      brew install cocoapods
      ;;
    *) err "❌ 未选择安装方式";;
  esac
  pod setup
  info "✅ CocoaPods 安装完成"
  pod --version | tee -a "$LOG_FILE"
}
```

### 🎯 设置**`Ruby`**镜像源（根据 IP 自动判断） <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
set_gem_source() {
  COUNTRY=$(curl -s https://ipinfo.io | jq -r '.country')
  if [[ "$COUNTRY" == "CN" ]]; then
    gem sources --remove https://rubygems.org/ 2>/dev/null
    gem sources --add https://gems.ruby-china.com/
    info "🇨🇳 使用 Ruby 中国镜像"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null
    gem sources --add https://rubygems.org/
    info "🌐 使用默认 Ruby 镜像"
  fi
  gem sources -l | tee -a "$LOG_FILE"
}
```

### 🎯 镜像切换 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 1、**CocoaPods** 镜像切换 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
switch_cocoapods_source() {
  local sources=(
    "清华源|https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git"
    "华为源|https://repo.huaweicloud.com/repository/CocoaPods/"
  )
  local selected_source url

  selected_source=$(printf "%s\n" "${sources[@]}" | fzf --prompt="🎯 选择 CocoaPods 镜像源：") || return 1
  url="${${selected_source}#*|}"

  info_echo "🧩 正在切换镜像源为: $url"
  pod repo remove trunk >/dev/null 2>&1 || true
  pod repo add trunk "$url"
  echo "$url" > "$CONFIG_FILE"
  success_echo "📦 已记住镜像源: $url"
}
```

#### 2、**Ruby** 镜像切换 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
set_gem_source() {
  if is_in_china; then
    gem sources --remove https://rubygems.org/ 2>/dev/null
    gem sources --add https://gems.ruby-china.com/ 2>/dev/null
    note_echo "🇨🇳 当前在中国，已切换为 Ruby 中国镜像源"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null
    gem sources --add https://rubygems.org/ 2>/dev/null
    note_echo "🌐 当前不在中国，已切换为官方 Ruby 镜像源"
  fi

  info_echo "📦 当前 RubyGem 源列表："
  gem sources -l | tee -a "$LOG_FILE"
}
```



### 🎯 检测本地**`Java`**环境是否已经安装 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

> **`command -v java`**：检查 `java` 命令是否存在于 `PATH` 中；
>
> **`>/dev/null 2>&1`**：忽略输出（标准输出和错误输出）；
>
> 如果存在，则执行 `then` 块，否则执行 `else`。
>
> **`java -version 2>&1 | head -n 1`**：获取 `java -version` 输出（通常是多行），`head -n 1`：只取第一行显示版本号。
>
> **`echo "JAVA_HOME" "${JAVA_HOME:-[未设置]}"`**：`${JAVA_HOME:-[未设置]}`：如果 `JAVA_HOME` 没有设置，就显示 `[未设置]`；

```shell
if command -v java >/dev/null 2>&1; then
    java -version 2>&1 | head -n 1
    echo "JAVA_HOME" "${JAVA_HOME:-[未设置]}"
else
    echo "未安装 Java"
fi 
```

### 🎯 全更新 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

**`.zshrc`**

 ```shell
 update() {
     brew update && brew upgrade && brew cleanup && brew doctor && brew -v # Homebrew
     dart pub global activate fvm                                          # fvm
 }
 ```

### 🎯 删除🍺**`Homebrew`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
# 1. 尝试 untap & 清理
brew untap homebrew/core || true
brew cleanup || true

# 2. 官方卸载脚本（HEAD 版）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# 3. 手动删除常见路径（Intel 和 M 系）
sudo rm -rf /usr/local/Caskroom/
sudo rm -rf /usr/local/Frameworks/
sudo rm -rf /usr/local/Homebrew/
sudo rm -rf /usr/local/bin/
sudo rm -rf /usr/local/etc/
sudo rm -rf /usr/local/include/
sudo rm -rf /usr/local/lib/
sudo rm -rf /usr/local/opt/
sudo rm -rf /usr/local/sbin/
sudo rm -rf /usr/local/share/
sudo rm -rf /usr/local/var/
sudo rm -rf /opt/homebrew/

# 4. 修复 fatal: Could not resolve HEAD 错误
brew_repo=$(brew --repo homebrew/core 2>/dev/null)
if [[ -n "$brew_repo" ]]; then
  sudo rm -rf "$brew_repo"
fi
```

### 🎯 **`Git`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 🎯 1、删除本地**`Git`**缓存目录 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
REPO_PATH="$HOME/.cocoapods/repos/cocoapods"
if [ -d "$REPO_PATH" ]; then
  print_green "🗑️ 删除本地 git 源缓存目录: $REPO_PATH"
  rm -rf "$REPO_PATH"
else
  print_green "✅ 本地 git 缓存目录不存在，无需删除"
fi
```

#### 🎯 2、删除**`CDN`**源**`trunk`** <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
if pod repo list | grep -q "^trunk"; then
  print_green "🔍 检测到 trunk（CDN 源），正在删除..."
  pod repo remove trunk
else
  print_green "✅ 未检测到 trunk（CDN 源），无需删除"
fi
```

#### 🎯 3、添加**`Git`**源 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
print_green "🔗 正在添加 Git 源 https://github.com/CocoaPods/Specs.git ..."
pod repo add cocoapods https://github.com/CocoaPods/Specs.git
```

### 🎯 `Shell`

#### 🎯 1、切换`Shell` <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
# ========== 获取所有可用 shell ==========
available_shells=($(cat /etc/shells | grep -E "^/"))

if [[ ${#available_shells[@]} -eq 0 ]]; then
    echo "❌ 无法读取可用 shell"
    exit 1
fi

# ========== fzf 选择 ==========
echo "🎯 请选择你要切换的默认 shell："
selected_shell=$(printf "%s\n" "${available_shells[@]}" | fzf --prompt="Shell ➜ ")

if [[ -z "$selected_shell" ]]; then
    echo "❌ 未选择 shell，操作取消"
    exit 1
fi

# ========== 执行切换 ==========
echo "🔧 正在切换默认 shell 为：$selected_shell"
chsh -s "$selected_shell"
```

#### 🎯 2、显示当前`Shell` <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
echo "✅ 当前默认 shell 已更新为："
dscl . -read ~/ UserShell
```

#### 🎯 3、打开新的终端窗口并切换到脚本所在的目录 <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open_terminal_and_cd() {
    local dir="$1"
    osascript <<EOF
tell application "Terminal"
    do script "cd $dir"
    activate
end tell
EOF
}
```

#### 🎯 4、关闭终端窗口  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
close_terminal_window() {
    # 获取所有终端窗口的索引
    WINDOW_IDS=$(osascript -e 'tell application "Terminal" to get id of every window')
    # 将索引分行并输出
    echo "当前终端ID为："
    echo "$WINDOW_IDS" | tr ',' '\n'
    # 假设要关闭第一个窗口（索引从1开始）
    WINDOW_TO_CLOSE=$(echo "$WINDOW_IDS" | tr ',' '\n' | head -n 1)
    # 关闭指定窗口
    osascript -e "tell application \"Terminal\" to close (every window whose id is $WINDOW_TO_CLOSE) without saving"
}
```

#### 🎯 5、打开新的终端窗口  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
open_terminal_and_cd() {
    local dir="$1"
    osascript <<EOF
tell application "Terminal"
    do script "cd $dir"
    activate
end tell
EOF
}
```

> ```shell
> current_directory=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录 
> open_terminal_and_cd "$current_directory" # 打开新的终端窗口并切换到脚本所在的目录
> ```

#### 🎯 6、仅对当前`Shell`有效的临时环境  <a href="#目的" style="font-size:17px; color:green;"><b>🔼</b></a>

```shell
# ================================== 通用开发环境变量配置 ==================================

# ✅ Android SDK 根目录（默认路径，若 ANDROID_HOME 未设置则自动补上）
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"

# ✅ Android 工具路径（无论系统是否配置，当前 shell 会话内始终有效）
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# ✅ Android cmdline tools Homebrew 安装路径（可选备用）
export PATH="/opt/homebrew/share/android-commandlinetools/cmdline-tools/latest/bin:$PATH"

# ✅ Dart pub 全局工具路径（如 fvm）
export PATH="$HOME/.pub-cache/bin:$PATH"

# ✅ Flutter FVM 默认路径（用于未配置 FVM 的情况）
export PATH="$HOME/fvm/default/bin:$PATH"

# ✅ Homebrew.coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# ✅ 检测本地项目内 FVM，并加入本地 flutter 路径（自动支持 .fvm 项目）
if [[ -d ".fvm/flutter_sdk" ]]; then
  export PATH="$(pwd)/.fvm/flutter_sdk/bin:$PATH"
fi

# ✅ CocoaPods Git 源修复依赖（部分网络下需设置语言）
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ✅ jenv 初始化（确保脚本中可以用 jenv 控制 Java）
if [[ -d "$HOME/.jenv" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# ✅ Homebrew 安装路径加入 PATH（根据芯片架构区分，确保 brew 可用）
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
else
  export PATH="/usr/local/bin:$PATH"
fi

# ✅ Flutter 镜像源（可选：解决国内访问慢的问题）
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"

# ✅ Xcode 工具路径（必要时强制指定 Xcode 命令路径）
# export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

# ✅ 手动注入某些环境变量块（如 fvm）
# inject_shellenv_block "fvm_env" 'export PATH="$HOME/.pub-cache/bin:$PATH"'
```



