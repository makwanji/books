# Install pm2

## Backend
sudo npm install -g pm2
pm2 start server.js --name backend
pm2 save
pm2 startup



## list services

pm2 list


## logs of the services:


pm2 logs backend

## Check the services

sudo lsof -i :8000

adminuser@app-vm:~/books/backend$ sudo lsof -i :8000
COMMAND    PID      USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
node\x20/ 1599 adminuser   20u  IPv6  11214      0t0  TCP *:8000 (LISTEN)
adminuser@app-vm:~/books/backend$




## frontend
export REACT_APP_BACKEND_URL=http://10.0.9.4:8001

sudo npm install -g pm2

npm run build

pm2 serve /home/adminuser/books/frontend/build 3000 --spa
