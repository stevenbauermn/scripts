#!/bin/bash

# Create Variables
# Package list
packages=('tree' 'fortune' 'cowsay' 'nano' 'neofetch' 'net-tools' 'wget')
bru=~/.bashrc
scripts=/home/$(whoami)/scripts

# Check if packages are installed
for package in ${packages[@]};
do
  if [ ! $(which $package) ];
  then
    echo "Installing $package:"
    sudo apt install -y $package 
  else
    echo -e "\n$package is already installed."
  fi
done
echo -e "\nPackage installation is complete!"

# Setup scripts folder
echo -e "\nCheck for scripts folder.\n"
if [ ! -d $scripts ];
then
  mkdir $scripts
  chown $(whoami):$(whoami) $scripts
fi
echo -e "\nThe $scripts folder is setup."

# Setup .bashrc
echo -e "\nSetup the .bashrc environment."
if [ "$(cat ~/.bashrc | grep 'Sysadmin Greetings')" != "# Sysadmin Greetings" ]
then
  # Make .bashrc backup
  cp $bru ~/.bashrc.$(date +%Y%m%d).bak
  echo -e "\nBackup of .bashrc is .bachrc.$(date +%Y%m%d).bak"

    # Update .bashrc
    echo -e "\n# Sysadmin Greetings" >> $bru
    echo "clear" >> $bru
    echo "neofetch" >> $bru
    #echo "uptime -p" >> $bru
    echo "fortune | cowsay" >> $bru
    #echo -e "\r" >> $bru
    echo "echo Hello $USER! What will you learn today?" >> $bru
    #echo -e "\r" >> $bru 
    echo "# Custom Aliases" >> $bru
    echo "alias lsa='ls -a'" >> $bru
    echo "alias docs='cd ~/Documents'" >> $bru
    echo "alias dwn='cd ~/Downloads'" >> $bru
    echo "alias etc='cd /etc'" >> $bru
    echo "alias rc='nano ~/.bashrc'" >> $bru
    echo "alias logs='mkdir -p ~/research && sudo cp /var/log/* /etc/passwd'" >> $bru
    echo "alias reload='source ~/.bashrc'" >> $bru
    echo "alias rc='nano ~/.bashrc'" >> $bru
    echo "source ~/.bashrc"
else
  echo "The .bashrc was already updated."
fi
    #echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/s$" >> $bru
echo "The .bashrc envrionment setup is complete."

#Print out and log Exit
echo -e "\n$(date) Script Finished. Exiting." | tee -a $1

exit