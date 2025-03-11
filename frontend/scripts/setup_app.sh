#!/bin/bash
git clone https://github.com/makwanji/books.git
cd books/frontend
npm install
cp .env.sample .env
npm run build
sudo cp -r build/* /var/www/html
sudo systemctl restart nginx
