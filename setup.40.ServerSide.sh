##################################################
source ~/.nvm/nvm.sh
echo 'try nvm ls'
nvm use node
nvm ls
node -v
npm -v
##################################################

echo "---install global express---"
npm install -g express
npm install -g express-generator

echo "---install mongoDB---"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get -y update
sudo apt-get install -y mongodb-org

echo "---http://blog.prolificinteractive.com/2015/01/21/getting-vagrant-nodejs-windows-play-well-together/---"
echo "---#symlink to install nodemodules outside of the shared dir---"
#sudo mkdir -p -v /vagrant_internal/node_modules/
#sudo chown -R $(whoami) /vagrant_internal/node_modules/
#sudo ln -s /vagrant/app/node_modules/ /vagrant_internal/node_modules/

echo "---scafold express app---"
rm -rf /vagrant/app/server/
cd /vagrant/app/
express server -f

#sudo chown -R $(whoami) /vagrant/app/
#.staging/async-59cbdd72

cd /vagrant/app/server/
echo "---npm install---"
npm install --no-bin-links
echo "---npm install mongoose---"
npm install mongoose --no-bin-links --save
echo "---npm install body-parser---"
npm install body-parser --save
echo "---npm install method-override---"
npm install method-override --save
echo "---npm install passport---"
npm install passport --save

#echo "---npm install passport-pocket---"
#sudo npm -g install passport-pocket --save

#npm start