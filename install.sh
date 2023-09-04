#!/bin/bash

# Check if password is provided as argument
if [ -z "$1" ]; then
  echo "Error: Please provide the password as the first argument."
  exit 1
fi

password="$1"

echo "$password" | sudo -S apt update
echo "$password" | sudo -S apt upgrade

echo "$password" | sudo -S apt install git
cat config.txt | grep email | awk ' { print $2 } ' | xargs git config --global user.email
cat config.txt | grep name | awk '{ for(i=2; i<=NF; i++) printf "%s ", $i; }' | rev | cut -c 2- | rev | sed 's/.*/"&"/' | xargs git config --global user.name
echo "$password" | sudo -S apt install cmake
echo "$password" | sudo -S apt install build-essential
echo "$password" | sudo -S apt install pip
echo "$password" | sudo -S apt install vim
echo "$password" | sudo -S apt install zip
echo "$password" | sudo -S apt install gh
echo "$password" | sudo -S apt install clang-format
echo "$password" | sudo -S apt install valgrind

pip install -r requirement.txt
