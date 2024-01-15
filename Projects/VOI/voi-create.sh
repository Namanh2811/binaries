#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi

# Logo
sleep 1 && curl -s https://raw.githubusercontent.com/vnbnode/binaries/main/Logo/logo.sh | bash && sleep 1

# Create wallet or Recovery wallet
echo -e "\e[1m\e[32m5. Create wallet or Recovery wallet... \e[0m" && sleep 1
SelectVersion="Please choose: \n 1. Create wallet (Gives you 30 seconds to save the seed wallet)\n 2. Recovery wallet"
echo -e "${SelectVersion}"
read -p "Enter index: " version;
if [ "$version" != "2" ];then
	goal wallet new voi
    sleep 30
else
	goal wallet new -r voi
fi
sleep 1

# To create a new account or Recovery account
echo -e "\e[1m\e[32m6. Create wallet or Recovery wallet... \e[0m" && sleep 1
SelectVersion="Please choose: \n 1. Create account (Gives you 30 seconds to save the address wallet)\n 2. Recovery account"
echo -e "${SelectVersion}"
read -p "Enter index: " version;
if [ "$version" != "2" ];then
	goal account new
    sleep 30
else
	goal account import
fi
sleep 1

# Goal account export
echo -e "\e[1m\e[32m7. Goal account export... \e[0m" && sleep 1
echo -ne "\nEnter your voi address: " && read addr &&\
goal account export -a $addr

cd $HOME
rm $HOME/voi-create.sh
