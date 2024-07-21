from kyt import *

@bot.on(events.NewMessage(pattern=r"(?:.start|/start)$"))
@bot.on(events.CallbackQuery(data=b'start'))
async def start(event):
        inline = [
            [Button.inline("PANEL CREATE ACCOUNT","menu")],
            [Button.url("GROUP","https://t.me/configsantri"),
             Button.url("ORDER","https://t.me/alawivpn")]
        ]
        sender = await event.get_sender()
        val = valid(str(sender.id))
        if val == "false":
                try:
                    await event.answer("Akses Ditolak", alert=True)
                except:
                    await event.reply("Akses Ditolak")
        elif val == "true":
                sh = f' cat /etc/ssh/.ssh.db | grep "###" | wc -l'
                ssh = subprocess.check_output(sh, shell=True).decode("ascii")
                vm = f' cat /etc/vmess/.vmess.db | grep "###" | wc -l'
                vms = subprocess.check_output(vm, shell=True).decode("ascii")
                vl = f' cat /etc/vless/.vless.db | grep "###" | wc -l'
                vls = subprocess.check_output(vl, shell=True).decode("ascii")
                tr = f' cat /etc/trojan/.trojan.db | grep "###" | wc -l'
                trj = subprocess.check_output(tr, shell=True).decode("ascii")
                sdss = "cat /etc/os-release | grep -w PRETTY_NAME | awk -F'=' '{print $2}' | sed 's/\"//g' | sed 's/ *(.*)//' | awk '{for(i=1;i<=10;i++) printf $i\" \"; if(NF>10) printf \"...\"; print \"\"}'"
                namaos = subprocess.check_output(sdss, shell=True).decode("ascii")
                
                # Menghitung uptime
                with open('/proc/uptime', 'r') as f:
                    uptime_seconds = float(f.readline().split()[0])
                uptime_var = "{:02d}:{:02d}:{:02d}".format(int(uptime_seconds // 3600), int((uptime_seconds % 3600) // 60), int(uptime_seconds % 60))
                
                ipvps = f" curl -s ipv4.icanhazip.com"
                ipsaya = subprocess.check_output(ipvps, shell=True).decode("ascii")
                citsy = f" cat /etc/xray/city"
                city = subprocess.check_output(citsy, shell=True).decode("ascii")

                msg = f"""
━━━━━━━━━━━━━━━━━━━━━━━
    ☘️ **PANEL MENU PREMIUM** ☘️
━━━━━━━━━━━━━━━━━━━━━━━
**» DOMAIN  :** `{DOMAIN}`
**» IP VPS  :** `{ipsaya.strip()}`
**» CITY  :** `{city.strip()}`
**» O.S  :** `{namaos.strip().replace('"','')}`
━━━━━━━━━━━━━━━━━━━━━━━
**» UPTIME VPS :** `{uptime_var}`
━━━━━━━━━━━━━━━━━━━━━━━
**» @alawivpn**
━━━━━━━━━━━━━━━━━━━━━━━
"""
                x = await event.edit(msg, buttons=inline)
                if not x:
                    await event.reply(msg, buttons=inline)

