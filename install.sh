# Update OS
sudo apt -y update
sudo apt -y upgrade

# Enable PPA
sudo apt install -y software-properties-common

# Install git et. al.
sudo apt -y install \
  git nano inotify-tools curl wget \
  firefox gdebi synaptic vlc chromium-browser \
  snap snapd-xdg-open \
  traceroute net-tools whois libxml2-utils\
  pptpd ppp pptp-linux \
  default-jdk

# Prerequisites for Erlang
sudo apt -y install build-essential autoconf \
  m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev \
  libglu1-mesa-dev libpng-dev libssh-dev \
  unixodbc-dev xsltproc fop

# Uninstall Apps
sudo apt -y purge epiphany-browser epiphany-browser-data
sudo apt -y purge pantheon-mail
# sudo apt -y purge noise
# sudo apt -y purge audience

# Add minimize button
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo apt -y update
sudo apt -y install elementary-tweaks

# archive formats
sudo apt -y install unace rar unrar p7zip-rar p7zip \
        sharutils uudeview mpack arj cabextract lzip lunzip

# Atom
sudo snap install atom --classic

# Hiri
sudo snap install hiri

# Node
sudo apt -y update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y install nodejs

# Postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-12 postgresql-client-12
sudo apt -y install pgadmin4 pgadmin4-apache2

# VSCode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y update
sudo apt -y install code

# read -p "Press [Enter] key to start asdf install ..."

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
cd ~
FILE='.bashrc'
LINE='. $HOME/.asdf/asdf.sh'
grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
LINE='. $HOME/.asdf/completions/asdf.bash'
grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"

# Need to start a new terminal to load the asdf commands
# . ~/.bashrc
# The above command did not seem to work

# Clean Up OS
sudo apt -y autoremove
sudo apt -y autoclean
