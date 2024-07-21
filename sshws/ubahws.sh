#!/bin/bash

clear
G='\e[1;32m'
Y='\e[0;33m'
C='\e[1;36m'
O='\e[1;37;46m'
W='\e[1;37m'
N='\e[0m'
FILE="/usr/local/bin/ws-stunnel"
BACKUP_FILE="${FILE}.bak"

[ ! -f "$BACKUP_FILE" ] && cp "$FILE" "$BACKUP_FILE"

clear
echo -e " $C—————————————————————————————————————————$N"
echo -e " $O         UBAH RESPON HTTP/1.1 101        $N"
echo -e " $C—————————————————————————————————————————$N"
echo
echo -e " ${Y}Masukkan teks baru ${G}!!!${N}"
read -rp " $(echo -e "${C}---> : ${N}")" teksmu
echo -e " ${Y}Masukkan warna contoh: cyan ${G}!!!${N}"
read -rp " $(echo -e "${C}---> : ${N}")" warnamu

OLD_LINE="RESPONSE = 'HTTP/1.1"
NEW_LINE="RESPONSE = 'HTTP/1.1 101 <b><font color=${warnamu}>${teksmu}</font></b>\\r\\nUpgrade: websocket\\r\\nConnection: Upgrade\\r\\nSec-WebSocket-Accept: foo\\r\\n\\r\\n'"
NEW_LINE_ESCAPED=$(echo "$NEW_LINE" | sed 's/[&/\]/\\&/g')
sed -i "\|^${OLD_LINE}|c\\${NEW_LINE_ESCAPED}" "$FILE"

systemctl restart ws-stunnel
clear
[[ $warnamu == "red" ]] && warna='\e[1;31m' ||
[[ $warnamu == "green" ]] && warna='\e[1;32m' ||
[[ $warnamu == "yellow" ]] && warna='\e[1;33m' ||
[[ $warnamu == "blue" ]] && warna='\e[1;34m' ||
[[ $warnamu == "magenta" ]] && warna='\e[1;35m' ||
[[ $warnamu == "cyan" || $warnamu == "aqua" ]] && warna='\e[1;36m' ||
[[ $warnamu == "white" ]] && warna='\e[1;37m'
baru="${warna}${teksmu}${N}"
echo
echo -e " ${G}DONE!!!${N}"
echo -e " Respon ${W}HTTP/1.1 101 ${baru} ${W}Sudah aktif${N}"
echo -e "${W} Silahkan konekkan SSH.nya untuk dites!!!${N}"
