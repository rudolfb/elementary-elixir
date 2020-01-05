# elementary-elixir
Install Erlang, Elixir and Phoenix on ElementaryOS, after clean install

Note: need to set the sh files to executable.

```bash
./install.sh
./post_install.sh
```

The first file install.sh does all the preperation
The post_install.sh actually installs Erlang, Elixir and Phoenix using asdf.

## First Things First

- [x] **Enable PPA**

	```bash
	sudo apt -y update
	sudo apt install -y software-properties-common
	```

- [x] **Install apt-fast**

  ```bash
	sudo add-apt-repository -y ppa:apt-fast/stable
	sudo apt -y install apt-fast
	# echo "alias apt='apt-fast'" >> ~/.bashrc
	cd ~
	FILE='.bashrc'
	LINE="alias apt='apt-fast'"
	grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
	source ~/.bashrc
  ```

- [x] **Update OS**

	```bash
	sudo apt -y update && sudo apt -y upgrade
	```

- [x] **Install git et. al.**

	```bash
	sudo apt -y install \
            git nano inotify-tools curl wget \
            firefox gdebi synaptic vlc chromium-browser \
            snap snapd-xdg-open \
            traceroute net-tools whois \
            pptpd ppp pptp-linux \
            default-jdk
	```

- [x] **Uninstall Apps**

	```bash
	sudo apt -y purge epiphany-browser epiphany-browser-data
	sudo apt -y purge pantheon-mail
	# sudo apt -y purge noise
	# sudo apt -y purge audience
	```

- [x] **Clean Up OS**

	```bash
	sudo apt -y autoremove
	sudo apt -y autoclean
	```

---

## Tweaking the UI

- [x] **Add minimize button**

	```bash
	sudo add-apt-repository ppa:philip.scott/elementary-tweaks
	sudo apt -y update && sudo apt -y install elementary-tweaks
	```
	- then do `System Settings`>`Tweaks`>`Appearance`>`Window Controls` and
	set the **Layout** value to **Ubuntu** or **Minimize Left**


- [x] **Firefox**

	I do not like the right click behavior in Firefox on Linux. The right click requires me to keep the button clicked, and then select a context menu item. Better for me is to click the right mouse button, then the context menu opens, and then I can click on the appropriate line.

	In order to change this behavior in Firefox:

	- Enter **about:config** in the URL
	- Search for **ui.context_menus.after_mouseup**
	- Toggle to value from **false** to **true**

---

## APPS TO DOWNLOAD & INSTALL

- [x] [**AnyDesk**](https://anydesk.com/en/downloads/linux)

- [x] [**TeamViewer**](https://www.teamviewer.com/de/download/windows/)

---

## APPS TO INSTALL & CONFIGURE VIA TERMINAL

- [x] **Atom**

	http://ubuntuhandbook.org/index.php/2019/12/install-atom-apt-repository-ubuntu-18-04/

	```bash
	wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
	sudo apt -y update && sudo apt -y install atom
	```
	Alternative:
	
	```bash
	sudo snap install atom --classic
	```
	
- [x] **archive formats**

	```bash
	sudo apt -y install unace rar unrar p7zip-rar p7zip \
            sharutils uudeview mpack arj cabextract lzip lunzip
	```

- [x] **Node**

	https://computingforgeeks.com/how-to-install-nodejs-on-ubuntu-debian-linux-mint/

	Add Node.js APT Repository

	```bash
	sudo apt -y update
	sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	```

	Install Node.js 12 on Ubuntu

	```
	sudo apt -y install nodejs
	```

- [x] **Postgres**

	```bash
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
	sudo apt update
	sudo apt -y install postgresql-12 postgresql-client-12
	```

	```bash
	sudo su - postgres
	psql -c "alter user postgres with password 'postgres'"
	```

	```bash
	sudo apt -y install pgadmin4 pgadmin4-apache2
	```


- [x] **asdf - for Erlang and Elixir**

	Terminal as **normal** user
	```bash
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
	# echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
	# echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
	# The following ensures the line is appended only if it does not exist
	cd ~
	FILE='.bashrc'
	LINE='. $HOME/.asdf/asdf.sh'
	grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
	LINE='. $HOME/.asdf/completions/asdf.bash'
	grep -xqF -- "$LINE" "$FILE" || echo -e "\n$LINE" | tee --append "$FILE"
	source ~/.bashrc
	```
	Note, the terminal needs to re-load the **.bashrc** after writing the **asdf** paths, thus the **source** command above, otherwise any following **asdf** commands will fail. And because we are using our own session when running **asdf** commands, we have to ensure that we are in our user session and not in the root session when installing **asdf**.

	The **grep** commands above search for the line that needs to be added to the **.bashrc**, and only if the text is not found the text is appended to the file.

	https://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-does-not-already-exist#comment49743511_3557165

- [x] **Erlang**

  Prerequisites for Erlang asdf install
	```bash
	sudo apt -y install build-essential autoconf \
            m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev \
            libglu1-mesa-dev libpng-dev libssh-dev \
            unixodbc-dev xsltproc fop
	```

	Install Erlang

	```bash
	asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
	asdf list-all erlang
	asdf install erlang 22.2.1
	asdf global erlang 22.2.1
	```
- [x] **Elixir**

	```bash
	asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
	asdf list-all elixir
	asdf install elixir 1.9.4-otp-22
	asdf global elixir 1.9.4-otp-22
	```

- [x] **Phoenix**

	https://hexdocs.pm/phoenix/installation.html

	```bash
	mix do local.hex --force , \
         local.rebar --force , \
         archive.install hex phx_new 1.4.11 --force
	```

- [x] **VSCode - Visual Studio Code**

	```
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt -y update && apt -y install code
	```

	After installation we need to install a few VSCode extentions:

	- ElixirLS Fork: https://marketplace.visualstudio.com/items?itemName=elixir-lsp.elixir-ls
	- vscode-elixir: https://marketplace.visualstudio.com/items?itemName=mjmcloug.vscode-elixir
	- vscode-elixir-formatter: https://marketplace.visualstudio.com/items?itemName=sammkj.vscode-elixir-formatter

- [x] **Hiri - Email client**

	```bash
	sudo snap install hiri
	```

---

## Credits

* [@superb](https://gist.github.com/suberb/4635a6c338f0f66b63c0f502859e5b42)
* [@inercia](https://gist.github.com/inercia/3f11aa96dd80bb1c2056745c8a9b0f7d)
* [@surendrajat](https://gist.github.com/Surendrajat/418d5fd66876848a7f21870fe09365a7)
