echo "---install nvm---" #https://github.com/creationix/nvm/blob/master/README.markdown
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm ls

echo "---deal with evironmental variables---"
#printf export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" >> ~/.bashrc
#source ~/.bashrc
echo 'echo "running ~/.profile"' >> ~/.profile
echo 'source ~/.nvm/nvm.sh' >> ~/.profile

echo 'echo "running ~/.bashrc"' >> ~/.bashrc
echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc

echo "---install node---"
nvm install node
sudo nvm install node

echo "---get forever---"
npm install forever -g

echo "---node and npm versions---"
node -v
npm -v

echo "---symlink for nodejs to be also called node---"
sudo ln -s /usr/bin/nodejs /usr/bin/node

# let's get "node_modules" out of the synced folder
mkdir -p -v /home/vagrant/app/client/node_modules
mkdir -p -v /home/vagrant/app/server/node_modules

sudo ln -s /vagrant/app/server/node_modules/ /home/vagrant/app/server/node_modules
sudo ln -s /vagrant/app/client/node_modules/ /home/vagrant/app/client/node_modules