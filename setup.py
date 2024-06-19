"""
Author: ilovecxty
Description: Generate linux install script by python
"""

linux_setup = {
    "shell":["zsh","fish"],
    "shelltool":["starship","zoxide","fzf","ripgrep"],
    "shelltool_plus":["bat","exa","fd","tldr",
                      "delta","broot","mcfly","bottom",
                      "glances","gtop","gping","procs"],
    "editor":["vim","neovim"],
    "editor_plus":["gvim","emacs","helix","nano"],
    "editor_pro":["lapce"],
    "fetch":["fastfetch"],
    "fetch_plus":["neofetch"],
    "git":["git","lazygit"],
    "filemanager":["yazi"],
    "filemanager_plus":["nnn","ranger"],
    "ide":["vscode"],
    "ide_plus":["qtcreator"],
    "cpp":["make","cmake","llvm","clang","gcc"],
    "python":["vscode"],
    "font":["ttf-cascadia-mono-nerd","ttf-cascadia-code-nerd"],
    "font_plus":["ttf-sarasa-gothic"],
}

"""
omz=("oh-my-zsh-git")# this is in yay lib
mutiwindow=("i3wm" "hyprland" "tmux" "terminator")
system=("htop")
useless=("lolcat" "cowsay" "flameshot")
pkgmanager=("yay" "paru")
python=("python3" "pip" "conda")
"""

basic_linux=linux_setup["shell"]+linux_setup["shelltool"]+linux_setup["shelltool_plus"]+ \
linux_setup["editor"]+linux_setup["fetch"]+linux_setup["git"]+linux_setup["filemanager"]+ \
linux_setup["font"]

def get_package_install_command():
    arch="sudo pacman -S "
    return arch

if __name__ == "__main__":
    print(basic_linux)
    with open("setup.sh", "w") as file:
        file.write(get_package_install_command())
        file.write(" ".join(basic_linux))
