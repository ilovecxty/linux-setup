echo "hello world shell!"
echo "Will install basic tools"

install_safe() {
	# install_safe "${shell[@]}"
	for element in "$@"; do
		echo "$element"
	done
}

install_new() {
	# install_new shell
	local -n arr=$1
	for element in "${arr[@]}"; do
		echo "$element"
	done
}

check_version() {
	# check_version "${shell[@]}"
	for element in "$@"; do
		$element --version
	done
}

# shell tool
shell=("zsh" "fish")
shellsetup=("starship")
omz=("oh-my-zsh-git")
shelltool=("zoxide" "fzf" "ripgrep")
shelltool_plus=("bat" "exa" "fd" "tldr" "delta"
"broot" "mcfly" "bottom" "glances" "gtop" "gping" "procs")
# editor
editor=("vim" "neovim")
editor_plus=("gvim" "emacs" "helix" "nano")
editor_pro=("lapce")
# other tool
fetch=("fastfetch")
fetch_plus=("neofetch")
gittool=("git" "lazygit")
filemanager=("yazi")
filemanager_plus=("nnn" "ranger")
#
mutiwindow=("i3wm" "hyprland" "tmux" "terminator")
system=("htop")
useless=("lolcat" "cowsay" "flameshot")
pkgmanager=("yay" "paru")
# code
ide=("vscode")
ide_plus=("qtcreator")
cpp=("make" "cmake" "llvm" "clang")
# purify
font=("ttf-cascadia-mono-nerd" "ttf-cascadia-code-nerd")
font_plus=("ttf-sarasa-gothic")

install_basic() {
	echo "Install packages: "
	echo "${shell[@]}" "${shellsetup[@]}" "${shelltool[@]}" "${editor[@]}" "${gittool[@]}" "${filemanager[@]}"
	sudo pacman -S "${shell[@]}" "${shellsetup[@]}" "${shelltool[@]}"
	sudo pacman -S "${editor[@]}" "${gittool[@]}" "${filemanager[@]}"
}

######## SHRC INSTALL #########
install_bashrc_utm() {
	echo "Ultimate Bashrc auto download!"
	echo "WILL OVERWRITE orginal bashrc!!"
	curl -L https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc/download --output ~/.bashrc
	curl -L https://sourceforge.net/projects/ultimate-bashrc/files/_bashrc_help/download --output ~/.bashrc_help
}
install_bashrc_bashit() {
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	~/.bash_it/install.sh
}
install_bashrc_omb() {
	git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
	cp ~/.bashrc ~/.bashrc_backup
	cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc
	source ~/.bashrc
}
install_fishrc_omf() {
	git clone https://github.com/oh-my-fish/oh-my-fish ~/.oh-my-fish
	cd ~/.oh-my-fish
	bin/install --offline
}
install_zshrc_omz() {
	git clone https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
	cd ohmyzsh/tools
	REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh install.sh
}
install_zshrc_pre() {
	zsh
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	setopt EXTENDED_GLOB
	for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	done
}

###### VIMRC INSTALL #########
install_spacevim() {
	curl -sLf https://spacevim.org/cn/install.sh | bash
}
install_amixvim() {
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
}
install_lazyvim() {
	mv ~/.config/nvim ~/.config/nvim.bak
	mv ~/.local/share/nvim ~/.local/share/nvim.bak
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
	nvim
}
install_nvchadvim() {
	git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
}
install_lunarvim() {
	LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
}

install_basic