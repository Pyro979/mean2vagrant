##################################################
source ~/.nvm/nvm.sh
echo 'try nvm ls'
nvm use node
nvm ls
node -v
npm -v
nvm use --delete-prefix v6.3.1 --silent
##################################################

sudo mv -f /vagrant/app/nginx.conf /etc/nginx/

sudo service nginx restart

cd /vagrant/app/server
echo "---start the node server---"
PORT=8081 forever start -v --minUptime 1000 --spinSleepTime 1000 -c "npm start" ./

echo "---Use Hot Module Replacement---"
# change directory to our repo
cd /vagrant/app/client
PORT=8080 HOST="0.0.0.0" npm run server:dev:hmr

##note: use this instead of the task below if you don't want hot module replacement
#echo "---start the webbpack server---"
#forever start -c "npm start" ./


#PORT=8080 HOST="0.0.0.0" forever start -v -d -m 1 --minUptime 1000 --spinSleepTime 1000 -c "npm run server:dev:hmr" ./


#echo "---forever list---"
#forever list