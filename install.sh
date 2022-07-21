apt update -y
apt upgrade -y
apt install nano htop neofetch speedtest-cli golang -y
go get github.com/yudai/gotty
BLUE='\033[1;34m'
RED='\033[1;31m'
echo "${RED}Don't forget to open the port in GoormIDE settings !"
echo "${BLUE}Command to start GoTTY: ~/go/bin/gotty -a 0.0.0.0 -p INTERNAL_PORT -w -c LOGIN:PASSWORD bash"
rm install.sh
