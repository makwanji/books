

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
