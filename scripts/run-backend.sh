#!/bin/bash

docker run --rm --name books-backend -d -p ${BACKEND_PORT}:${BACKEND_PORT} \
  -e DB_HOST=${DB_HOST} \
  -e DB_PORT=${DB_PORT} \
  -e DB_USER=${DB_USER} \
  -e DB_PASSWORD=${DB_PASSWORD} \
  -e DB_NAME=${DB_NAME} \
  -e PORT=${BACKEND_PORT} \
  -e CORS_ORIGIN=${CORS_ORIGIN} \
  books-backend:v1.0.0
