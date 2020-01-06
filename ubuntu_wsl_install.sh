# Update OS
sudo apt -y update
sudo apt -y upgrade

# Install git et. al.
sudo apt -y install \
        git nano inotify-tools curl wget \
        traceroute net-tools whois \
        default-jdk

# Prerequisites for Erlang
sudo apt -y install build-essential autoconf \
        m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev \
        libglu1-mesa-dev libpng-dev libssh-dev \
        unixodbc-dev xsltproc fop

# archive formats
sudo apt -y install unace rar unrar p7zip-rar p7zip \
        sharutils uudeview mpack arj cabextract lzip lunzip

# Node
sudo apt -y update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -y install nodejs

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
