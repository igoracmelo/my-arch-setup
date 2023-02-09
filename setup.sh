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

if ! [ -x "$(command -v vim)" ]; then
	sudo ln -s /usr/bin/nvim /usr/bin/vim 
fi

if ! [ -x "$(command -v lvim)" ]; then
	LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)
fi

if ! [ -x "$(command -v yarn)" ]; then
	# i hate to do sudo npm but the solution is not very practical
	sudo npm i -g yarn 
fi

if ! [ -d ~/.oh-my-zsh ]; then
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
fi

