#!/bin/bash

OUT_DIR=~/local
TEMP_DIR=./tmp

LINK_SKYPE=https://go.skype.com/skypeforlinux-64.deb
LINK_WPS=http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9505/wps-office_11.1.0.9505.XA_amd64.deb

#-- create tmp dir
mkdir $OUT_DIR
mkdir $TEMP_DIR
rm -rf $TEMP_DIR/*

printf "\n---> Installing Nice Fonts\n\n"
mkdir ~/.fonts
cp ./fonts/* ~/.fonts

printf "\n---> Terminal Story Configs\n"
cp ./os/.inputrc ~/

printf "\n---> Installing Sublime\n"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text
mkdir ~/.config/sublime-text-3/Packages/Colorsublime-Themes
cp ./sublime/*.tmTheme ~/.config/sublime-text-3/Packages/Colorsublime-Themes
cp ./sublime/my_settings.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cp sublime/my_keys.sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
cp ./sublime/snippets/* ~/.config/sublime-text-3/Packages/User/

printf "\n---> Installing Terminator\n\n"
sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get -y update
sudo apt-get -y install terminator
mkdir ~/.config/terminator/
cp terminator/config ~/.config/terminator/

printf "\n---> Installing Tree\n"
sudo apt-get -y install tree

printf "\n---> Installing Eye of Gnome\n"
sudo apt-get -y install eog

printf "\n---> Installing VLC Media Player\n"
sudo apt-get -y install vlc

printf "\n---> Installing Support for Archive Formats and Restricted Extras\n"
sudo apt-get -y install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

printf "\n---> Installing Skype\n"
wget $LINK_SKYPE -O $TEMP_DIR/skype.deb
sudo dpkg -i $TEMP_DIR/skype.deb
sudo apt-get -y -f install

printf "\n---> Installing Kazam\n"
sudo add-apt-repository -y ppa:kazam-team/stable-series
sudo apt-get update
sudo apt-get -y install kazam

printf "\n---> Installing Simple Screen Recorder\n"
sudo apt-add-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install -y simplescreenrecorder

printf "\n---> Installing Cheese\n"
sudo apt-get -y install cheese

printf "\n---> Alacarte - Menu editor\n"
sudo apt-get -y install alacarte

printf "\n---> KeePassX - Password Manager\n"
sudo apt-get -y install keepassx

printf "\n---> Installing WPS Office\n"
wget $LINK_WPS -O $TEMP_DIR/wps.deb
sudo dpkg -i $TEMP_DIR/wps.deb
sudo apt-get -y -f install

printf "\n---> Installing Gimp\n"
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo apt-get update
sudo apt-get -y install gimp

printf "\n---> Latex\n"
# sudo add-apt-repository ppa:texlive-backports/ppa
# sudo apt -y install texlive-full
# sudo apt -y install texlive-latex-base
# sudo apt -y install texlive-latex-extra
# sudo apt -y install texlive-fonts-recommended
# sudo apt -y install texlive-fonts-extra
# sudo apt -y install latexmk


printf "\n---> Installing Inkscape\n"
sudo apt-get -y install inkscape

printf "\n---> Installing Brave\n"
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt -y install brave-browser

printf "\n---> Installing Office 365\n"  # https://github.com/sirredbeard/unofficial-webapp-office
snap install unofficial-webapp-office

printf "\n---> Installing One Drive\n"  # https://github.com/skilion/onedrive
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libsqlite3-dev
sudo snap install --classic dmd && sudo snap install --classic dub

mkdir -p $HOME/local; cd $HOME/local
git clone https://github.com/skilion/onedrive.git
cd onedrive
make
sudo make install

# uninstall
# sudo make uninstall
## delete the application state
# rm -rf .config/onedrive


printf "\n##########################################################\n"

rm -rf $TEMP_DIR


