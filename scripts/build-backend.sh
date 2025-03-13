#!/bin/bash

# build and tag
docker build -t books-backend:${BACKEND_IMAGE_TAG} ./backend
