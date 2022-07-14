apt update -y ; apt upgrade -y ; apt install curl -y ; curl -sSL https://get.docker.com | sh ; sudo usermod -aG docker $(whoami) ; exit

docker run -d \
  --name=wg \
  -e WG_HOST="vpn.svell.ml" \
  -e PASSWORD="SF8888" \
  -e WG_PORT="8888" \
  -e WG_PERSISTENT_KEEPALIVE="25" \
  -e WG_DEFAULT_ADDRESS="10.0.0.x" \
  -e WG_DEFAULT_DNS="1.1.1.1, 8.8.8.8" \
  -v ~/.wg-easy:/etc/wireguard \
  -p 8888:8888/udp \
  -p 80:80/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy

ufw allow 22/tcp
ufw allow 8888/udp
ufw allow 80/tcp
ufw enable
