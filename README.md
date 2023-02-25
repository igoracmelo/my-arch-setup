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
  lsd
  zoxide
  man

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
  google-chrome
  neovim
)

yay -S --needed ${pkgs[@]}
```

# docker post install
```sh
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl start docker
docker run --rm hello-world
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## install external plugins
autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

syntax highlighting
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# install lunarvim
```sh
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
```

# install yarn
```sh
# i hate to do sudo npm but it is the quicker way
sudo npm i -g yarn
```

# setup git user
```sh
git config --global user.name 'Igor Melo'
git config --global user.email 'igoracmelo@protonmail.com'
```

# setup starship
```sh
curl -sS https://starship.rs/install.sh | sh
```

# setup dotfiles
```sh
cd Git/pessoal/dotfiles
bash init.sh
```

# SSH
```sh
ssh-keygen
```
