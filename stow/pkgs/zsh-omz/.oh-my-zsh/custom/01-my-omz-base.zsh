# Oh My Zsh 基础配置：环境变量和选项设置
# 此文件由 OMZ 自动从 custom 目录加载
# 加载顺序：01-base → 02-functions → 03-aliases

# ===== 环境变量和导出设置 =====

# 编辑器设置
export EDITOR="vim"
export VISUAL="vim"

# 开发环境
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# 路径添加（根据需要自定义）
# 如果目录存在，添加本地 bin 目录到 PATH
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# 历史记录设置
export HISTSIZE=100000

# Less 分页器设置
export LESS="-R"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# 自定义项目路径（根据需要自定义）
export DOTFILES_DIR="$HOME/dotfiles"
export WORKSPACE_DIR="$HOME/workspace"

# ===== Shell 选项配置 =====

# 历史记录增强设置（OMZ 默认配置之外的额外优化）
# setopt INC_APPEND_HISTORY       # 立即写入历史文件（不等 shell 退出）
# setopt HIST_IGNORE_ALL_DUPS     # 删除历史中所有重复项（不只是连续的）
# setopt HIST_FIND_NO_DUPS        # 搜索历史时跳过重复项
# setopt HIST_SAVE_NO_DUPS        # 保存时去除重复项
# setopt HIST_REDUCE_BLANKS       # 删除多余的空格

# 目录操作优化
# setopt PUSHD_SILENT             # pushd/popd 时不打印目录栈

# 补全系统增强
# setopt PATH_DIRS                # 即使命令包含斜杠也进行路径搜索

# 拼写纠正
# setopt CORRECT                  # 尝试纠正命令拼写
# setopt CORRECT_ALL            # 纠正所有参数拼写（可选，较激进）

# 任务控制
# setopt AUTO_RESUME              # 在创建新进程前尝试恢复现有任务

# ===== 系统集成 =====

# Tmux 集成（通过 SSH 连接时）
if command -v tmux >/dev/null 2>&1 && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    # 通过 SSH 连接时自动启动 tmux 会话
    # 取消下一行注释以启用此行为
    # exec tmux new-session -A -s main
fi

# 自定义欢迎信息（仅登录 shell 显示）
if [[ -o login ]]; then
    echo "欢迎回来，$(whoami)！🚀"
    echo "今天是 $(date '+%Y年%m月%d日 %A')"
fi