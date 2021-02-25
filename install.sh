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


# Emacs 27 for ubuntu
sudo add-apt-repository ppa:kelleyk/emacs --yes
sudo apt remove emacs

sudo apt update
sudo apt install -y curl vim emacs27 zsh gnupg openssh-server fonts-powerline

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
	rm ~/.zshrc
fi

# Install Spacemacs
echo "Installing Spacemacs..."
if [[ -d .emacs.d ]];
then
	mv .emacs.d .emacs.d.bak
	mv .emacs .emacs.bak
fi

git clone https://github.com/syl20bnr/spacemacs -b develop ~/.emacs.d

# Install custom spacemacs layers (TODO: move this to spacemacs somehow)
git clone https://github.com/mhkc/google-calendar-layer ~/.emacs.d/private/google-calendar


# Install Dropbox
if [[ ! -d ~/.dropbox-dist ]];
then
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
	exec ~/.dropbox-dist/dropboxd &
	cd $INSTALLDIR
fi

# Install Source Code Pro Font
installSourceCodePro 

# Symlinks existing files
for f in `ls -A $INSTALLDIR -I .git -I install.sh -I ".*.swp"`
do
	echo "Installing $f"
	ln -sv $INSTALLDIR/$f ~
done


