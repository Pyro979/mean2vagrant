vagrant ssh -- -t 'source ~/.nvm/nvm.sh; nvm use node; cd /vagrant/app/server; PORT=8081 forever start -v --minUptime 1000 --spinSleepTime 1000 -c "npm start" ./'

vagrant ssh -- -t 'source ~/.nvm/nvm.sh; nvm use node; cd /vagrant/app/client; PORT=8080 HOST="0.0.0.0" npm run build:dev'

vagrant ssh -- -t 'source ~/.nvm/nvm.sh; nvm use node; cd /vagrant/app/client; PORT=8080 HOST="0.0.0.0" npm run server:dev:hmr'

pause





