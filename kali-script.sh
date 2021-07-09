#!/bin/bash

tools="false"

while getopts ":t" opt; do
    case $opt in
        t)
            # echo "-t was triggered" >&2
            # echo "oalallalaal"
            tools="true"
            ;;
        \?)
            echo "Invalid options: -$OPTARG" >&2
            ;;
    esac
done


echo "Kali post installation script"
# Move tmux conf to default location
echo "Copy tmux.conf to default location"
cp .tmux.conf ~/.tmux.conf

# Install application I need
## impacket scripts - smbserver, psexec...
echo "Installing impacket-scripts"
sudo apt install impacket-scripts
## install nishang 
echo "Installing nishang"
sudo apt install nishang
## 7z2john suport file
echo "Installing library for 7z2john"
sudo apt install libcompress-raw-lzma-perl -y
## sublime install
echo "Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
## install bloodhound
echo "Installing Bloodhound"
sudo apt install bloodhound
## install gdb
echo "Installing GDB with GEF"
sudo apt install gdb
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
## install pip3
echo "Installing pip3"
sudo apt install python3-pip 


## Installing application for github / non apt repos....
if [ "$tools" == "true" ]
then
    echo "installing tools"
    # Create directory and ignore if exist
    mkdir -p ~/tools
    cd ~/tools
    # Clone winPeas/Linpeas
    git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git ~/tools/privilege-escalation-awesome-scripts-suite/
    # install ghidra
    wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.0_build/ghidra_10.0_PUBLIC_20210621.zip
    unzip ghidra_10.0_PUBLIC_20210621.zip
    rm ghidra_10.0_PUBLIC_20210621.zip
    sudo apt install default-jdk
    # ntml theft
    git clone https://github.com/Greenwolf/ntlm_theft.git 
    # winrm-client
    mkdir winrm-client
    wget https://raw.githubusercontent.com/Alamot/code-snippets/master/winrm/winrm_shell.rb
    echo '!/usr/bin/ruby' | cat - winrm_shell.rb > winrm-client/winrm.rb
    rm -rf winrm_shell.rb
    sudo gem install winrm
    # install evil-winrm
    sudo gem install winrm winrm-fs stringio
    git clone https://github.com/Hackplayers/evil-winrm.git
    # install wwwolf-php-webshell
    git clone https://github.com/WhiteWinterWolf/wwwolf-php-webshell.git
    # install oletools - olevba
    pip3 install oletools
    # install sherlock
    git clone https://github.com/rasta-mouse/Sherlock
    # windwos-exploit-suggester
    git clone https://github.com/7Ragnarok7/Windows-Exploit-Suggester-2.git
    wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
    python get-pip.py
    python -m pip install --user xlrd==1.1.0
    # wes-ng
    git clone https://github.com/bitsadmin/wesng.git
    pip install mechanicalsoup

fi