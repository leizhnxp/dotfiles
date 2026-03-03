# Oh My Zsh 自定义函数
# 此文件由 OMZ 自动从 custom 目录加载
# 加载顺序：01-base → 02-functions → 03-aliases

# 引用 bash-profile 包中的共享 shell 函数
# 检查多个可能的函数文件位置

# 方法 1：检查实际部署位置（使用 stow 时）
FUNCTION_FILE="$HOME/.config/my-oh-bash/function.sh"

# 方法 2：如果未找到，尝试相对路径（无 stow 部署时）
if [[ ! -f "$FUNCTION_FILE" ]]; then
    DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/../../../.." && pwd)"
    FUNCTION_FILE="$DOTFILES_ROOT/bash-profile/.config/my-oh-bash/function.sh"
fi

# 如果找到函数文件则引用
if [[ -f "$FUNCTION_FILE" ]]; then
    source "$FUNCTION_FILE"
else
    echo "警告：未找到 shell 函数。请安装 bash-profile 包以获取 shell 函数。"
fi

# 如果需要，可以在下面添加 OMZ 特定函数
# 示例：
# omz_specific_function() {
#     # 仅限 OMZ 的功能
# }