# sync, install sudo, setup user as sudo
```sh
su root -c "pacman -Syu sudo && usermod -aG wheel $USER"
```

# yay
```sh
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
```

# installing programs from official repos and AUR
```sh
pkgs=(
  # daily utilities
  chromium
  ksysguard
  ffmpeg
  obs-studio
  zsh
  fd
  ripgrep
  vlc
  ncdu
  kwin-bismuth
  bat

  # developer tools
  git
  base-devel
  make
  nodejs
  npm
  jdk11-openjdk
  python
  pip
  go
  rust
  docker
  docker-compose
  visual-studio-code-bin
  neovim
)

yay -S --needed ${pkgs[@]}
```

# docker post install
```sh
sudo usermod -aG docker $USER
newgrp docker
```

# globally alias neovim to vim
```sh
sudo ln -s /usr/bin/nvim /usr/bin/vim
```

# install fzf
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# oh-my-zsh
```sh
sh -c $("curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")
```

## install external plugins (TODO:)
autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

syntax highlighting
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## on zshrc
```sh
export ZSH="/home/igor/.oh-my-zsh"

ZSH_THEME="half-life"
CASE_SENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
  git
  colored-man-pages
  # dirhistory
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# configuring highlight
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=black,bold"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=black,bold"

source $ZSH/oh-my-zsh.sh

# custom git aliases and stuff
g' | grep -vw 'svn' | fzf"
alias gdc="git diff --cached"
alias grf="git reflog"
alias grz="git reset"
alias grzs="git reset --soft"
alias grzh!="git reset --hard"
alias gclean!="git clean -f"
alias gstl="git stash list --oneline"
alias gpro="git pull --rebase origin"
alias gprod="git pull --rebase origin develop"
alias grl="git log --pretty=\"%C(reset)%<(7)%C(green)%h%C(reset)   %<(90,trunc)%s  %<(11,trunc)%an   %<(10,trunc)%C(yellow)%ar\" --co
lor"
alias gstk="git stash --keep-index"
alias gstuk="git stash --include-untracked --keep-index"
# alias gstau="git stash push -u"
# alias gstaum="git stash push -um"
alias gwip="git commit --no-verify --no-gpg-sign -m '--wip-- [skip ci]'"
alias glff="git pull --ff-only"

function grco() {
  res="$(grf | grep checkout: | egrep -o "to .*" | cut -d' ' -f2 | awk '!x[$0]++' | fzf)"
  [ $? -eq 0 ] && gco "$res"
}

# lsd
alias ls="lsd"
alias l="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lal="lsd -al"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER='@@'
FZF_BAT="--preview='bat {} --style=numbers --color=always --line-range :200'"
export FZF_DEFAULT_OPTS="--extended --height 100% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fdfind"
export FZF_CTRL_R_OPTS="--extended --height 100% --layout=reverse --border"
export FZF_CTRL_T_OPTS="$FZF_BAT"

# zsh-autosuggestions
bindkey '^ ' forward-word
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zoxide (TODO:)
alias j="z"
alias jj="z -"
alias ji="zi"
alias jci="zci"

# bat (TODO:)
export BAT_PAGER="less -R"

# ffmpeg (TODO: use profiles)
alias ffmpeg="ffmpeg -hide_banner -loglevel error -stats"

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
```

# install lunarvim
```sh
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
```
# install yarn
```sh
# i hate to do sudo npmit but it is the quicker way
sudo npm i -g yarn
```

# setup git user
```sh
git config --global user.name 'Igor Melo'
git config --global user.email 'igoracmelo@protonmail.com'
```

# setup starship (TODO:)
```sh
```

# SSH
```sh
ssh-keygen
```
# install lunarvim (TODO:)
```sh
```
