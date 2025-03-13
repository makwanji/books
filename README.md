

## Backend


# Build docker image

docker build -t book-backend-app .

# Run docker iamge

docker run -p 5002:5010 \
  -e DB_HOST=${DB_HOST} \
  -e DB_PORT=${DB_PORT} \
  -e DB_USER=${DB_USER} \
  -e DB_PASSWORD=${DB_PASSWORD} \
  -e DB_NAME=${DB_NAME} \
  -e PORT=5010 \
  book-backend-app

## frontend

docker build -t book-frontend-app .

docker run -p 3000:8080 \
  -e REACT_APP_BACKEND_URL="http://localhost:5001" \
  my-react-frontend

docker run -p 3000:80 -e REACT_APP_BACKEND_URL=${API_BASE_URL} my-react-frontend


DB_HOST="18.136.147.42"
DB_PORT=5432
DB_USER="bookuser"
DB_PASSWORD="book#app21"
DB_NAME="booksdb"
PORT=8000

# start container db
docker-compose --env-file .env up db --force-recreate --build -d

# start container db
docker-compose --env-file backend/.env up backend --force-recreate --build -d
