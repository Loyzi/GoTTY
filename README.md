docker run -d \
  --name=wg-easy \
  -e WG_HOST="vpn.svell.ml" \
  -e PASSWORD="yluu35Acy" \
  -v ~/.wg-easy:/etc/wireguard \
  -p 8888:8888/udp \
  -p 80:80/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy
