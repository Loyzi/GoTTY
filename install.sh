apt update -y
apt upgrade -y
apt install nano htop tmux golang -y
go get github.com/yudai/gotty
BLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
echo
echo
echo
echo "${RED}Don't forget to open the port in GoormIDE settings !"
echo "${BLUE}Command to start ${GREEN}GoTTY${BLUE}: ~/go/bin/gotty -a 0.0.0.0 -p INTERNAL_PORT -w -c LOGIN:PASSWORD bash"
echo
echo
echo
rm install.sh
