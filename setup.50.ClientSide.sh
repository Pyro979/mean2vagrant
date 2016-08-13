##################################################
source ~/.nvm/nvm.sh
echo 'try nvm ls'
nvm use node
nvm ls
node -v
npm -v
nvm use --delete-prefix v6.3.1 --silent
##################################################

echo "---install global dependencies---"
#https://github.com/AngularClass/angular2-webpack-starter#dependencies
npm install --global webpack
npm install --global webpack-dev-server
npm install --global karma-cli
npm install --global protractor
npm install --global typescript
npm install webpack-dev-server rimraf webpack -g

echo "---clone repo from https://github.com/AngularClass/angular2-webpack-starter---"
# --depth 1 removes all but one .git commit history
rm -rf /vagrant/app/client/
mkdir -p -v /vagrant/app/client/
git clone --depth 1 https://github.com/angularclass/angular2-webpack-starter.git /vagrant/app/client/

# change directory to our repo
cd /vagrant/app/client/

echo "---install the repo with npm multiple tries---"
NPM=-1
GUARD=20
COUNTER=1
until [ ${NPM} -eq 0 ] || [ ${COUNTER} -gt ${GUARD} ]; do
  echo "try ${COUNTER}"
  npm i --no-bin-links
  let NPM=$?
  let COUNTER+=1
done

