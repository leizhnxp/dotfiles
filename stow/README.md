# Stow 配置管理指南

本目录使用 [GNU Stow](https://www.gnu.org/software/stow/) 管理 dotfiles 配置文件。

## 目录结构

```
stow/
├── pkgs/                     # 配置包目录
│   ├── bash-profile/         # Bash 配置及环境管理
│   ├── stow-bash-completion/ # Stow 命令补全功能
│   ├── git-linux/            # Linux 系统的 Git 配置（XDG 方案）
│   ├── vim-native/           # Vim 编辑器配置
│   ├── readline/             # Readline 命令行编辑配置
│   └── zsh-omz/              # Oh My Zsh 个人定制配置
├── rc/
│   ├── install.sh            # Stow 初始化脚本
│   └── post-install.sh       # 启用补全功能脚本
├── README.md                 # 本文档
└── TODO.md                   # 待办事项和已知限制
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

### 2. 启用 Stow 命令补全（推荐）

为了获得更好的使用体验，建议启用 stow 命令的 tab 补全功能：

```bash
bash ~/dotfiles/stow/rc/post-install.sh
```

该脚本会：
- 安装 `bash-profile` 和 `stow-bash-completion` 核心包
- 提供多种补全激活方式供选择
- 可选择立即重启shell或稍后手动激活

激活后，你可以使用 `stow -S <TAB><TAB>` 来查看和选择可用的配置包。

**补全激活方式**：
- **选项1**：脚本结束时选择 `y` 立即重启shell
- **选项2**：手动运行 `source ~/.bash_profile`
- **选项3**：重启终端

### 3. 部署配置包

**如果已启用补全功能：** 可在任意目录直接使用 Tab 补全：

```bash
stow -S bash-profile     # 部署 Bash 配置，支持 <TAB> 补全包名
stow -S git-linux        # 部署 Git 配置
stow -S vim-native       # 部署 Vim 配置
stow -S readline         # 部署 Readline 配置
stow -S zsh-omz          # 部署 Oh My Zsh 配置
```

**如果没有安装基础包：** 建议进入 `pkgs/` 目录操作，以获得 Bash Tab 自动补全：

```bash
cd ~/dotfiles/stow/pkgs
stow -S bash-profile     # 部署 Bash 配置
stow -S git-linux        # 部署 Git 配置
stow -S vim-native       # 部署 Vim 配置
stow -S readline         # 部署 Readline 配置
stow -S zsh-omz          # 部署 Oh My Zsh 配置
```

**批量部署：**

```bash
cd ~/dotfiles/stow/pkgs
stow -S bash-profile git-linux vim-native readline zsh-omz
```

### 4. 卸载配置包

```bash
stow -D bash-profile     # 删除 bash-profile 的符号链接（支持 Tab 补全）
```

### 5. 重新部署（更新配置）

```bash
stow -R bash-profile     # 重新部署，相当于先 -D 再 -S（支持 Tab 补全）
```

## Stow 工作原理

Stow 通过创建符号链接来管理配置文件：

```
~/dotfiles/stow/pkgs/bash-profile/.bash_profile  →  ~/.bash_profile
~/dotfiles/stow/pkgs/git-linux/.config/git/config →  ~/.config/git/config
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

### bash-profile
Bash 配置及环境管理，特点：
- 基于 .bash_profile 的配置加载
- 模块化的环境变量和别名管理
- 集成 Oh My Bash 相关配置
- 自动加载 stow 命令补全功能

### stow-bash-completion
Stow 命令行智能补全，功能：
- 支持所有常用 stow 选项的自动补全
- 智能读取 `~/.stowrc` 配置文件
- 自动补全可用的包名，忽略隐藏目录
- 提供完整的 Tab 补全体验

### git-linux
Git 全局配置（XDG 方案），包含：
- **XDG 标准化配置**: 采用 `~/.config/git/` 目录结构
- **分层配置设计**: 利用 Git 原生配置分层机制
  - XDG 位置 (`~/.config/git/config`): 标准配置模板
  - 传统位置 (`~/.gitconfig`): 用户个人调整配置
- SSH 签名验证和全局 .gitignore 规则
- Gitmoji + Conventional Commits 提交模板
- 文件属性配置 (gitattributes)

### vim-native
Vim 编辑器配置，包含：
- 语法高亮（desert 主题）
- 制表符设置（4 空格）
- 不同文件类型的缩进规则

### readline
命令行编辑配置，支持：
- 上下箭头键历史记录前缀搜索

### zsh-omz
Oh My Zsh 个人定制配置，特点：
- 只包含自定义配置，不干扰 OMZ 默认安装
- 自定义别名、函数和基础配置
- 自动加载机制，无需修改主 .zshrc

## 注意事项

1. **首次部署前备份**：如果你的 HOME 目录已有同名配置文件，stow 会报错。建议先备份：
   ```bash
   mv ~/.bashrc ~/.bashrc.backup
   ```

2. **冲突处理**：如果 stow 报告冲突，检查目标位置是否已存在文件或目录。

3. **系统选择**：根据你的系统选择对应的配置包：
   - `bash-profile`: 通用的 Bash 配置，适用于大多数系统
   - `git-linux`: Linux 系统的 Git 配置
   - `zsh-omz`: Oh My Zsh 用户的个人定制配置

4. **配置更新**：修改 `stow/pkgs/` 下的配置文件后，由于使用符号链接，更改会立即生效，无需重新 stow。

5. **已知限制**：当前配置仅适用于管理 `$HOME` 目录下的 dotfiles。如果需要管理其他目录（如 `~/.local`）的软件包，请参考 [TODO.md](TODO.md) 中的解决方案。

6. **Git 配置分层机制**（重要）：`git-linux` 包采用 XDG 方案，利用 Git 原生的配置分层：
   - **XDG 配置** (`~/.config/git/config`): 本包提供的标准配置模板
   - **传统配置** (`~/.gitconfig`): 用户的个人调整配置
   - **仓库配置** (`.git/config`): 项目特定配置

   **注意**: 如果系统中不存在 `~/.gitconfig`，执行 `git config --global` 命令会直接写入XDG配置文件，可能覆盖本包的模板配置。建议在需要个人调整时手动创建 `~/.gitconfig` 文件。

## 故障排查

### 问题：stow 报告 "conflicts"

**原因：** 目标位置已存在文件或目录

**解决方法一：手动备份冲突文件**
```bash
# 查看具体冲突
stow -n -v -S bash-profile

# 备份冲突文件
mv ~/.bash_profile ~/.bash_profile.backup

# 重新部署
stow -S bash-profile
```

**解决方法二：使用 --adopt 选项（推荐）**
```bash
# 使用 --adopt 将现有文件"收养"到 stow 包中
stow --adopt -S bash-profile

# 此时现有的 ~/.bash_profile 会被移动到 ~/dotfiles/stow/pkgs/bash-profile/.bash_profile
# 并创建符号链接
```

⚠️ **注意：** 使用 `--adopt` 后，原有文件会覆盖 stow 包中的文件。如果你想保留 stow 包中的配置，应该：

```bash
# 1. 先 adopt 收养现有文件
stow --adopt -S bash-profile

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
