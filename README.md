# `KnightChaser/nvim-dotfile-v2` 
> (Powered by Lazy.nvim)

## 💭 Why a second version?

The [first version](https://github.com/KnightChaser/nvim-dotfile-v1) of my dotfiles was my Neovim *day one* adventure—cute, but a bit chaotic, with a bunch of copy-pasted configurations from somewhere on the Internet. It had too many unused plugins and a sprinkle of mysterious bugs. So... I waved goodbye and started fresh from scratch! This version is cleaner, more stable, and less stress.

---

## Installation Guide

Follow these simple steps to summon this config into your terminal world~! Before setting up, prepare your Neovim first. It's encouraged to use Neovim Nightly version, which can be easily managed and installed via [nvim-bob](https://github.com/MordechaiHadad/bob) tool.

### 1. Install Required Packages

Make sure the essentials are ready (for Ubuntu/Debian-based systems):

```sh
sudo apt-get install -y curl ripgrep fd-find make
```

### 2. Backup or Remove Old Neovim Config

You can either **backup** your current setup or **wipe** it clean:

#### 🔒 Backup (safe & cozy)
```sh
mv ~/.config/nvim{,.backup}          # required
mv ~/.local/share/nvim{,.backup}     # optional but recommended
mv ~/.local/state/nvim{,.backup}
mv ~/.cache/nvim{,.backup}
```

#### 💥 Remove (no regrets, only vibes)
```sh
rm -rf ~/.config/nvim*
rm -rf ~/.local/share/nvim*
rm -rf ~/.local/state/nvim*
rm -rf ~/.cache/nvim*
```
### 3. Clone the Repository

Fetch this dotfile setup from my GitHub into your Neovim config directory:

```sh
git clone git@github.com:KnightChaser/nvim-dotfile-v2.git ~/.config/nvim
```

### 4. Launch Neovim & Sync the Magic

Open Neovim:
```sh
nvim
```

Then run this inside Neovim:
```
:Lazy sync
```

This will install missing packages, update versions, and basically *sparkle things up* ✨  
Once it’s done, you're ready to Neovim in style~! Stay sharp, stay fluffy, and may your configs never break again~ >_< 💻🌸
