# dotfiles

使用 [GNU Stow](https://www.gnu.org/software/stow/) 管理的配置文件，可在多台机器间同步。

## 结构

每个顶层目录是一个独立的 stow 包，目录内的文件结构映射到用户家目录：

```
dotfiles/
├── nvim/          # Neovim (AstroNvim) 配置
│   ├── init.lua
│   ├── lua/
│   └── ...
└── zellij/        # Zellij 终端复用器配置
    └── config.kdl
```

## 部署到新机器

```bash
# 1. 克隆仓库到家目录
git clone <repo-url> ~/dotfiles

# 2. 安装 stow
# Arch
sudo pacman -S stow
# Debian/Ubuntu
sudo apt install stow
# macOS
brew install stow

# 3. 部署全部配置
cd ~/dotfiles
stow */

# 或只部署某个包
stow nvim
stow zellij
```

Stow 会在家目录创建指向 `dotfiles/` 内文件的符号链接。

## 常用操作

```bash
# 移除某个包的链接
stow -D nvim

# 重新链接（配置结构变动后）
stow -R nvim

# 目标位置已有同名文件时，用 --adopt 将其收编进仓库
stow --adopt nvim
# ⚠ adopt 会用目标机器上的文件覆盖仓库中的版本，之后用 git diff 检查
```

## 添加新配置

以 bash 为例：

```bash
# 在 dotfiles 中按家目录结构创建包
mkdir -p ~/dotfiles/bash
mv ~/.bashrc ~/dotfiles/bash/.bashrc

# 创建符号链接
cd ~/dotfiles
stow bash
```

## 多机同步

```bash
# 在任一机器上修改配置后提交推送
cd ~/dotfiles
git add -A && git commit -m "update nvim config"
git push

# 在其他机器上拉取即可，符号链接自动指向最新内容
cd ~/dotfiles
git pull
```

由于 stow 创建的是符号链接，`git pull` 后所有配置立即生效，无需重新执行 stow。
