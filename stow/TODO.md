# Stow 配置管理待办事项

## 当前限制

### 问题：`.stowrc` 硬编码 target 为 `$HOME`

当前 `install.sh` 生成的 `~/.stowrc` 配置：
```bash
--dir=/home/zhenhua.lei/dotfiles/stow/pkgs
--target=/home/zhenhua.lei
```

这个配置**硬编码了 target 为 `$HOME`**，导致只能管理用户主目录下的配置文件。

### 适用场景
✅ 管理 dotfiles（配置文件都在 `$HOME` 下）
- `.bashrc`, `.gitconfig`, `.vimrc` 等

### 不适用场景
❌ 管理本地安装包（通常安装到 `$HOME/.local` 或其他目录）
- `$HOME/.local/bin/` - 可执行文件
- `$HOME/.local/share/` - 应用数据
- `$HOME/.local/lib/` - 库文件
- `/opt/` - 第三方软件
- 自定义路径的软件包

### 具体问题示例

假设想用 stow 管理安装到 `~/.local` 的软件：

```bash
# 包结构
stow/pkgs/my-app/
└── bin/
    └── my-app

# 期望结果
~/.local/bin/my-app -> ~/dotfiles/stow/pkgs/my-app/bin/my-app

# 实际结果（使用当前 .stowrc）
~/bin/my-app -> ~/dotfiles/stow/pkgs/my-app/bin/my-app  # 错误位置！
```

## 可能的解决方案

### 方案一：不使用 `.stowrc`，每次指定参数

```bash
# 管理 dotfiles
cd ~/dotfiles/stow/pkgs
stow -t ~ -S bash-ubuntu

# 管理 local 安装包
cd ~/software/stow/pkgs
stow -t ~/.local -S my-app
```

**优点：**
- 灵活，可以指定任意 target

**缺点：**
- 命令冗长，失去了 `.stowrc` 的便利性
- 容易出错（忘记指定 `-t` 参数）

---

### 方案二：分离 dotfiles 和 software 的 stow 仓库

```bash
# dotfiles 仓库（target=$HOME）
~/dotfiles/stow/pkgs/
~/dotfiles/.stowrc  # --target=$HOME

# software 仓库（target=$HOME/.local）
~/software/stow/pkgs/
~/software/.stowrc  # --target=$HOME/.local
```

**优点：**
- 各自独立，互不干扰
- 每个仓库有自己的 `.stowrc`

**缺点：**
- 需要维护两个独立的仓库
- 增加管理复杂度

---

### 方案三：删除 `.stowrc`，使用 shell alias/function（推荐）

在 `.bashrc` 中定义：

```bash
# Stow 别名
alias stow-dotfiles='stow -d ~/dotfiles/stow/pkgs -t ~'
alias stow-local='stow -d ~/software/stow/pkgs -t ~/.local'
alias stow-opt='stow -d ~/software/stow/pkgs -t /opt'
```

使用方式：

```bash
# 管理 dotfiles
cd ~/dotfiles/stow/pkgs
stow-dotfiles -S bash-ubuntu

# 管理 local 安装包
cd ~/software/stow/pkgs
stow-local -S my-app
```

**优点：**
- 灵活，支持多个 target
- 保留 Tab 补全（在对应目录下）
- 命令简洁，语义清晰

**缺点：**
- 需要在 shell 配置中维护 alias
- 新环境需要重新配置

---

### 方案四：修改 install.sh，支持多场景

不生成全局 `~/.stowrc`，而是在每个 stow 仓库目录下生成本地 `.stowrc`：

```bash
# ~/dotfiles/stow/.stowrc
--dir=./pkgs
--target=/home/zhenhua.lei

# ~/software/stow/.stowrc
--dir=./pkgs
--target=/home/zhenhua.lei/.local
```

使用方式：

```bash
# 在对应目录下执行 stow
cd ~/dotfiles/stow/pkgs && stow -S bash-ubuntu
cd ~/software/stow/pkgs && stow -S my-app
```

**优点：**
- 每个仓库独立配置
- 使用相对路径，便于移植

**缺点：**
- 需要在特定目录下执行命令
- 需要修改现有的 install.sh 逻辑

---

### 方案五：使用 stow 的 `--target` 参数覆盖

保留 `.stowrc`，但在需要时用 `--target` 参数覆盖：

```bash
# 使用默认 target（$HOME）
cd ~/dotfiles/stow/pkgs
stow -S bash-ubuntu

# 覆盖 target
cd ~/software/stow/pkgs
stow --target=$HOME/.local -S my-app
```

**优点：**
- 保持现有配置不变
- 需要时灵活覆盖

**缺点：**
- 命令行参数会覆盖 `.stowrc`，但仍需手动指定
- 不够优雅

---

## 推荐方案

根据不同使用场景：

1. **只管理 dotfiles**：保持现状即可
2. **需要管理多种类型的包**：采用**方案三（shell alias）**
   - 删除 `~/.stowrc`
   - 在 `.bashrc` 中定义不同的 alias
   - 灵活且易于使用
3. **想要更规范的管理**：采用**方案四**
   - 为不同用途创建独立的 stow 仓库
   - 每个仓库有自己的本地 `.stowrc`

## 实施计划

- [ ] 评估实际使用场景（是否需要管理 local 安装包）
- [ ] 选择合适的解决方案
- [ ] 更新 `install.sh` 脚本（如果需要）
- [ ] 更新 README.md 文档
- [ ] 测试新方案的可行性

## 相关讨论

- 讨论日期：2026-02-25
- 问题发现：`.stowrc` 的 `--target` 参数硬编码为 `$HOME`，限制了 stow 的使用场景
- 核心矛盾：便利性（`.stowrc`）vs 灵活性（支持多 target）
