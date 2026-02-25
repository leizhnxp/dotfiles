# Stow 配置管理指南

本目录使用 [GNU Stow](https://www.gnu.org/software/stow/) 管理 dotfiles 配置文件。

## 目录结构

```
stow/
├── pkgs/              # 配置包目录
│   ├── bash-debian/   # Debian 系统的 Bash 配置
│   ├── bash-ubuntu/   # Ubuntu 系统的 Bash 配置
│   ├── git-linux/     # Linux 系统的 Git 配置
│   ├── vim-native/    # Vim 编辑器配置
│   └── readline/      # Readline 命令行编辑配置
├── rc/
│   └── install.sh     # Stow 初始化脚本
├── README.md          # 本文档
└── TODO.md            # 待办事项和已知限制
```

## 快速开始

### 1. 初始化配置

首次使用时，运行初始化脚本生成 `~/.stowrc` 配置文件：

```bash
bash ~/dotfiles/stow/rc/install.sh
```

该脚本会创建 `~/.stowrc` 文件，内容如下：

```
--dir=/home/你的用户名/dotfiles/stow/pkgs
--target=/home/你的用户名
```

这样配置后，stow 命令会：
- 从 `stow/pkgs/` 目录读取配置包
- 将符号链接创建到你的 HOME 目录

### 2. 部署配置包

**推荐方式：** 进入 `pkgs/` 目录操作，以获得 Bash Tab 自动补全：

```bash
cd ~/dotfiles/stow/pkgs
stow -S bash-ubuntu      # 部署 Ubuntu Bash 配置
stow -S git-linux        # 部署 Git 配置
stow -S vim-native       # 部署 Vim 配置
stow -S readline         # 部署 Readline 配置
```

**批量部署：**

```bash
cd ~/dotfiles/stow/pkgs
stow -S bash-ubuntu git-linux vim-native readline
```

### 3. 卸载配置包

```bash
cd ~/dotfiles/stow/pkgs
stow -D bash-ubuntu      # 删除 bash-ubuntu 的符号链接
```

### 4. 重新部署（更新配置）

```bash
cd ~/dotfiles/stow/pkgs
stow -R bash-ubuntu      # 重新部署，相当于先 -D 再 -S
```

## 为什么要进入 pkgs/ 目录？

虽然 `.stowrc` 已经配置了 `--dir` 参数，但**为了获得 Bash Tab 自动补全**，建议进入 `pkgs/` 目录操作：

### 场景对比

**在 pkgs/ 目录下：**
```bash
cd ~/dotfiles/stow/pkgs
stow -S bash-<Tab>  # 按 Tab 键会自动补全显示: bash-debian  bash-ubuntu
```
✅ 可以看到并选择可用的包名

**在其他目录：**
```bash
cd ~
stow -S bash-<Tab>  # 没有补全提示
```
❌ 必须记住完整的包名，或者先 `ls ~/dotfiles/stow/pkgs/` 查看

## Stow 工作原理

Stow 通过创建符号链接来管理配置文件：

```
~/dotfiles/stow/pkgs/bash-ubuntu/.bashrc  →  ~/.bashrc
~/dotfiles/stow/pkgs/git-linux/.gitconfig →  ~/.gitconfig
```

这样做的好处：
- 配置文件保存在 git 仓库中，便于版本控制
- 通过符号链接使用，修改立即生效
- 可以选择性部署不同系统的配置
- 卸载时只需删除符号链接，不影响原文件

## 常用命令

| 命令 | 说明 |
|------|------|
| `stow -S <package>` | 部署配置包（Stow） |
| `stow -D <package>` | 卸载配置包（Delete） |
| `stow -R <package>` | 重新部署配置包（Restow） |
| `stow -n -S <package>` | 模拟部署，不实际创建链接（dry-run） |
| `stow -v -S <package>` | 详细输出模式（verbose） |

## 配置包说明

### bash-debian
Debian 系统的 Bash 配置，特点：
- 历史记录：1000 条
- 基础别名：`ll`, `la`, `l`

### bash-ubuntu
Ubuntu 系统的 Bash 配置，特点：
- 历史记录：5000 条，详细时间戳
- 集成工具：NVM、x-cmd、envman
- 自定义别名：`llaa`（仅列出隐藏文件）

### git-linux
Git 全局配置，包含：
- SSH 签名验证
- Gitmoji + Conventional Commits 提交模板
- 全局 .gitignore 规则

### vim-native
Vim 编辑器配置，包含：
- 语法高亮（desert 主题）
- 制表符设置（4 空格）
- 不同文件类型的缩进规则

### readline
命令行编辑配置，支持：
- 上下箭头键历史记录前缀搜索

## 注意事项

1. **首次部署前备份**：如果你的 HOME 目录已有同名配置文件，stow 会报错。建议先备份：
   ```bash
   mv ~/.bashrc ~/.bashrc.backup
   ```

2. **冲突处理**：如果 stow 报告冲突，检查目标位置是否已存在文件或目录。

3. **系统选择**：根据你的系统选择对应的配置包：
   - Debian 系统使用 `bash-debian`
   - Ubuntu 系统使用 `bash-ubuntu`

4. **配置更新**：修改 `stow/pkgs/` 下的配置文件后，由于使用符号链接，更改会立即生效，无需重新 stow。

5. **已知限制**：当前配置仅适用于管理 `$HOME` 目录下的 dotfiles。如果需要管理其他目录（如 `~/.local`）的软件包，请参考 [TODO.md](TODO.md) 中的解决方案。

## 故障排查

### 问题：stow 报告 "conflicts"

**原因：** 目标位置已存在文件或目录

**解决方法一：手动备份冲突文件**
```bash
# 查看具体冲突
stow -n -v -S bash-ubuntu

# 备份冲突文件
mv ~/.bashrc ~/.bashrc.backup

# 重新部署
stow -S bash-ubuntu
```

**解决方法二：使用 --adopt 选项（推荐）**
```bash
# 使用 --adopt 将现有文件"收养"到 stow 包中
stow --adopt -S bash-ubuntu

# 此时现有的 ~/.bashrc 会被移动到 ~/dotfiles/stow/pkgs/bash-ubuntu/.bashrc
# 并创建符号链接
```

⚠️ **注意：** 使用 `--adopt` 后，原有文件会覆盖 stow 包中的文件。如果你想保留 stow 包中的配置，应该：

```bash
# 1. 先 adopt 收养现有文件
stow --adopt -S bash-ubuntu

# 2. 查看差异
cd ~/dotfiles
git diff

# 3. 决定保留哪个版本
# 如果要恢复 stow 包中的原始配置：
git checkout .

# 如果要保留现有配置：
git add .
git commit -m "采用系统现有配置"
```

### 问题：找不到 stow 命令

**解决：** 安装 GNU Stow

```bash
# Debian/Ubuntu
sudo apt install stow

# macOS
brew install stow
```

## 参考资源

- [GNU Stow 官方文档](https://www.gnu.org/software/stow/manual/stow.html)
- [使用 Stow 管理 Dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
