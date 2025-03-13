#!/bin/bash

docker run --rm --name books-frontend -d -p 80:80 \
  -e REACT_APP_BACKEND_URL="http://18.136.147.42:8000" \
  books-frontend:v1.0.0
