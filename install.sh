apt update -y
apt upgrade -y
apt install nano htop neofetch speedtest-cli golang -y
go get github.com/yudai/gotty
cd ~ ; ~/go/bin/gotty -a 0.0.0.0 -p 8080 -w -c root:123123 bash
BLUE='\033[1;34m'
RED='\033[1;31m'
echo -e "${RED}Don't forget to open the port in GoormIDE settings !"
echo -e "${BLUE}Command to start GoTTY: cd ~ ; ~/go/bin/gotty -a 0.0.0.0 -p INTERNAL_PORT -w -c LOGIN:PASSWORD bash"
