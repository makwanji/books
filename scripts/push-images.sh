#!/bin/bash

# backend
docker tag books-backend:v1.0.0 makwanji/books-backend:v1.0.0
docker push makwanji/books-backend:v1.0.0
docker scout quickview makwanji/books-backend:v1.0.0

# frontend
docker tag books-frontend:v1.0.0 makwanji/books-frontend:v1.0.0
docker push makwanji/books-frontend:v1.0.0
docker scout quickview makwanji/books-frontend:v1.0.0
