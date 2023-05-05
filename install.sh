#!/bin/bash
# Install script for my env

INSTALLDIR=$PWD

echo "Working from $INSTALLDIR"


function installSourceCodePro {
	echo "Installing Source Code Pro Font"
	local fontExists=$(fc-list | grep "Source Code Pro")
	if [[ "$fontExists" ]];
	then
		echo "Fonts are already installed; skipping..."
		return
	fi
	cd ~/Downloads
	wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
	if [ ! -d "~/.fonts" ] ; then
	    mkdir ~/.fonts
	fi
	unzip 1.050R-it.zip
	cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
	rm -rf source-code-pro*
	rm 1.050R-it.zip
	cd ~/
	fc-cache -f -v
}


# Emacs 28 for ubuntu
if [[ -d .emacs.d ]];
then
	mv .emacs.d .emacs.d.bak
	mv .emacs .emacs.bak
fi

sudo add-apt-repository ppa:kelleyk/emacs --yes
sudo apt remove -autoremove emacs emacs-commons

sudo apt update
sudo apt install -y curl vim emacs28 zsh gnupg openssh-server fonts-powerline stow

# Install solarized dircolors
if [[ ! -d ~/.dircolors ]];
then
	git clone git@github.com:seebi/dircolors-solarized.git ~/.dircolors
fi


# Install Oh My Zsh
if [[ ! -d $HOME/.oh-my-zsh ]];
then
	echo "Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
stow zsh

# Install Doom
echo "Installing Emacs..."
if [[ -d .emacs.d ]];
then
	mv .emacs.d .emacs.d.bak
	mv .emacs .emacs.bak
fi

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -rf "$HOME/.doom.d/"
stow doom


if [[ ! -d "$HOME/.local/bin/" ]];
then
	mkdir -p "$HOME/.local/bin"
fi

ln -s "$HOME/.emacs.d/bin/doom" "$HOME/.local/bin/doom"
doom sync

# Install Dropbox
if [[ ! -d ~/.dropbox-dist ]];
then
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
	exec ~/.dropbox-dist/dropboxd &
	cd $INSTALLDIR
fi

# Install Source Code Pro Font
installSourceCodePro
