copy /Y nginx.conf app/nginx.conf

vagrant ssh -- -t 'sudo mv -f /vagrant/app/nginx.conf /etc/nginx/nginx.conf; sudo nginx -t; sudo service nginx restart'

curlTest.bat

pause





