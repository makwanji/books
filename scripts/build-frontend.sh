#!/bin/bash

# build and tag
docker build -t books-frontend:${FRONTEND_IMAGE_TAG} ./frontend
