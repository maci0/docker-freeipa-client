#!/bin/sh
PASSWORD="changeme"
REALM="example.com"

#workaround
mv /usr/bin/domainname /usr/bin/domainname.bak
echo '#!/bin/sh
exit 0' > /usr/bin/domainname
chmod +x /usr/bin/domainname

ipa-client-install -U --server=ipa."${REALM}" --domain="${REALM}" -p admin -w "${PASSWORD}" --mkhomedir
