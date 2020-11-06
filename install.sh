#!/bin/bash
# Instal script for my env

INSTALLDIR=$PWD

echo "Working from $INSTALLDIR"

# Emacs 27 for ubuntu
sudo add-apt-repository ppa:kelleyk/emacs --yes
sudo apt remove emacs

sudo apt update
sudo apt install -y curl vim emacs27 zsh gnupg openssh-server fonts-powerline

# Install solarized dircolors
git clone git@github.com:seebi/dircolors-solarized.git ~/.dircolors


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


# Install Dropbox
if [[ ! -d ~/.dropbox-dist ]];
then
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
	exec ~/.dropbox-dist/dropboxd &
	cd $INSTALLDIR
fi

# Symlinks existing files
for f in `ls -A $INSTALLDIR -I .git -I install.sh -I ".*.swp"`
do
	echo "Installing $f"
	ln -sv $INSTALLDIR/$f ~
done


