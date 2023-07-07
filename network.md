docker network create -d macvlan \
  --subnet=192.168.41.0/24 \
  --gateway=192.168.41.1 \
  -o parent=eth0 macvlan0
