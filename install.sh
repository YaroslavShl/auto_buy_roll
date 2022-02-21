#!/bin/bash
. <(wget -qO- https://raw.githubusercontent.com/Zeustit/auto_buy_roll/main/main.sh)
printf "SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /bin/bash /root/rollsup.sh > /dev/null 2>&1
" > /etc/cron.d/massarolls
. <(wget -qO- https://raw.githubusercontent.com/YaroslavShl/LogoProMint/main/LogoProMint.sh)
