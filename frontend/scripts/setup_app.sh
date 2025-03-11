#!/bin/bash
git clone https://github.com/makwanji/books.git
cd books/frontend
npm install
cp .env.sample .env
npm run build
sudo mv /var/www/html /var/www/html.orig
sudo ln -s ~/books/frontend/build /var/www/html
sudo gpasswd -a www-data adminuser
sudo systemctl restart nginx
