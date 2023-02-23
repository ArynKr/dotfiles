#! /bin/bash

# get latest version of git installed
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# config git
git config --global user.name "Aryan Kumar"
git config --global user.email aryankumar1504@gmail.com

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# install nodejs lts version
nvm install --lts

# install unzip for unzipping (required in oh my posh)
sudo apt install unzip

# oh my posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# oh my posh themes
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

#### COPY YOUR BASHRC DOTFILE FROM GITHUB

# remove all these other than robbyrussell
cd .poshthemes && rm -v !(robbyrussell.omp.json)

# z jump directory setup
mkdir z && cd z
curl -LJO https://raw.githubusercontent.com/rupa/z/master/z.sh

# install gh cli
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

## REPLACE OLD DOTFILES

DOTFILES=(.bash_profile .gitconfig)
for dotfile in $(echo ${DOTFILES[*]});
do
    rm ~/$(echo $dotfile)
    ln -s ~/dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done
