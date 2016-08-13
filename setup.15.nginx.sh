echo "---get nginx---"
sudo apt-get -y install nginx

echo "---clear defaults nginx---"
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default