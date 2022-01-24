#!/bin/bash
# Still need to make keys readable for maddy https://maddy.email/tutorials/setting-up/
setfacl -R -m u:maddy:rX /etc/letsencrypt/{live,archive}
echo "ssl certs updated" && /etc/init.d/maddy restart
