#!/bin/bash
sudo date
CONTAINER=$(sudo docker run -d -h test.example.com --link ipa.example.com:ipa.example.com -v /sys/fs/cgroup:/sys/fs/cgroup:ro maci/freeipa-client /usr/lib/systemd/systemd)
echo ${CONTAINER}
echo "To enter docker container run: 
        sudo docker exec -t -i ${CONTAINER} /bin/bash"
