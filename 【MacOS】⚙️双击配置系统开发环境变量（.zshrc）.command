#!/bin/zsh

# ✅ 目标文件（可改为 .bash_profile、.zshrc 等）
target_file="$HOME/.zshrc"

# ✅ 要追加的内容（EOF block，内部不能用单引号）
append_block=$(cat <<EOF
flutter() { fvm flutter "\$@"; }

# ✅ 一键重新加载常见配置文件：jobs
jobs() {
  local files=(
    "\$HOME/.bash_profile"
    "\$HOME/.bashrc"
    "\$HOME/.oh-my-zsh/oh-my-zsh.sh"  # 去掉 \$HOME/.zshrc
  )
  for file in "\${files[@]}"; do
    if [[ -f "\$file" ]]; then
      source "\$file"
      echo "\\033[1;32m✅ 已加载配置文件：file://\$file\\033[0m"
    else
      echo "\\033[1;33m⚠️ 未找到配置文件：file://\$file\\033[0m"
    fi
  done
  echo "\\n📎 ⌘Command + 点击路径可打开对应文件（macOS Terminal 支持）"
}

# ✅ 仅首次执行 jobs 函数，防止递归
if [[ -z "\$JOBS_ALREADY_RUN" ]]; then
  export JOBS_ALREADY_RUN=1
  command -v jobs &>/dev/null && jobs
fi

clear
EOF
)

# ✅ 判断内容是否已存在
if grep -q 'flutter() { fvm flutter' "$target_file"; then
  echo "ℹ️ 内容已存在于 $target_file，跳过追加"
else
  echo "📝 正在追加内容到 $target_file ..."
  echo "\n$append_block" >> "$target_file"
  echo "✅ 追加完成，已更新 $target_file"
fi
