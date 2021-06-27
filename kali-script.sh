#!/bin/bash

tools="false"

while getopts ":t" opt; do
    case $opt in
        t)
            echo "-t was triggered" >&2
            echo "oalallalaal"
            tools="true"
            ;;
        \?)
            echo "Invalid options: -$OPTARG" >&2
            ;;
    esac
done


echo "Kali post installation script"
# Move tmux conf to default location
mv .tmux.conf ~/.tmux.conf

# Install application I need
## impacket scripts - smbserver, psexec...
sudo apt install impacket-scripts



## Installing application for github / non apt repos....
if [ "$tools" == "true" ]
then
    echo "installing tools"
    # Create directory and ignore if exist
    mkdir -p ~/tools
    # Clone winPeas/Linpeas
    git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git ~/tools

fi