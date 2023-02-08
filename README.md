# (wip) my-arch-setup
Documenting and possibly scripting how I set up Arch for development

## 1. Installation
Sorry, but I use `archinstall` btw, and I install a bunch of bloat I love.
- language: English
- layout: en-us
- mirrors: Brazil, Chile
- partitioning: ext4 + wipe disk + best effort
- disk encryption: yes
- profile: kde
- swap: no
- root password: yes

Tools for developing:
- git
- yay
- visual-studio-code-bin
- nodejs (19) | nodejs-lts-hydrogen (18) | nodejs-lts-gallium (16)
- npm
- jdk11-openjdk
- rustup: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo npm i -g yarn

Daily utilities:
- oh-my-zsh
- fzf
