# decided to not make is as a script per se, but instead a
# guide from where I can copy commands and run them, therefore
# making it quicker and simpler to document

# upgrade
su root -c "pacman -Syu"

# sudo: install and configure
if ! [ -x "$(command -v sudo)" ]; then
	su root -c "pacman -S sudo && usermod -aG wheel $USER"
fi

# yay
if ! [ -x "$(command -v yay)" ]; then
	sudo pacman -S git base-devel
	git clone https://aur.archlinux.org/yay-bin
	cd yay-bin
	makepkg -si
fi

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

# link vim -> nvim
if ! [ -x "$(command -v vim)" ]; then
	sudo ln -s /usr/bin/nvim /usr/bin/vim 
fi

# oh-my-zsh
if ! [ -d ~/.oh-my-zsh ]; then
	sh -c $("curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")
fi

# lunarvim
if ! [ -x "$(command -v lvim)" ]; then
	LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
fi

# yarn
if ! [ -x "$(command -v yarn)" ]; then
	# i hate to do sudo npm but the solution is not very practical
	sudo npm i -g yarn 
fi

# git user
git config --global user.name 'Igor Melo'
git config --global user.email 'igoracmelo@protonmail.com'

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"

ssh-keygen

# TODO: generate ssh keys
# TODO: docker group
# TODO: kwin-bismuth?
# TODO: ncdu?
# TODO: zshrc
# TODO: .gitconfig
