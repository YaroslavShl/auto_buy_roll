sudo tee /root/rollsup.sh > /dev/null <<EOF
#!/bin/bash
#Версия 0.06
cd /root/massa/massa-client
#Задаем переменные
candidat=\$(./massa-client wallet_info |grep 'Candidate rolls'|awk '{print \$3}')
massa_wallet_address=\$(./massa-client wallet_info |grep 'Address'|awk '{print \$2}')
tmp_final_balans=\$(./massa-client wallet_info |grep 'Final balance'|awk '{print \$3}')
final_balans=\${tmp_final_balans%%.*}
averagetmp=\$(/usr/bin/cat /proc/loadavg | awk '{print \$1}')
kv=100
var=\$(echo "scale=0; \$averagetmp*\$kv" | bc)
var1=\${var%%.*}
if [ \$var1 -lt "20" ];then
echo \`/bin/date +"%b %d %H:%M"\` "(rollsup) Загрузка машины \$var1% Нода скорее всего в подвисшем состоянии rolls покупаться не будет" >> /root/rolls.log
elif [ -z "\$candidat" ];then
echo \`/bin/date +"%b %d %H:%M"\` "Нода в данный момент не в сети" >> /root/rolls.log
elif [ \$candidat -gt "0" ];then
echo "Ok" > /dev/null
elif [ \$final_balans -gt "99" ]; then
echo \`/bin/date +"%b %d %H:%M"\` "Ролл слетел, проверяем количество монеток и пробуем купить" >> /root/rolls.log
else
