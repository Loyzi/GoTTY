apt update -y ; apt upgrade -y ; apt install curl -y ; curl -sSL https://get.docker.com | sh ; sudo usermod -aG docker $(whoami) ; exit

docker run -d \
  --name=wg \
  -e WG_HOST="vpn.svell.ml" \
  -e PASSWORD="SF8888" \
  -e WG_DEFAULT_ADDRESS="10.0.0.x" \
  -e WG_DEFAULT_DNS="1.1.1.1, 8.8.8.8" \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy

version: "3.8"

services:
  wg-easy:
    environment:
      # ⚠️ Change the server's hostname (clients will connect to):
      - WG_HOST=wg-easy.myhomelab.com
      # ⚠️ Change the Web UI Password:
      - PASSWORD=foobar123
    image: weejewel/wg-easy
    container_name: wg-easy
    hostname: wg-easy
    volumes:
      - ~/.wg-easy:/etc/wireguard
    ports:
      - "51820:51820/udp"
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.ip_forward=1
      - net.ipv4.conf.all.src_valid_mark=1

  nginx:
    image: weejewel/nginx-with-certbot
    container_name: nginx
    hostname: nginx
    ports:
      - "80:80/tcp"
      - "443:443/tcp"
    volumes:
      - ~/.nginx/servers/:/etc/nginx/servers/
      - ./.nginx/letsencrypt/:/etc/letsencrypt/
