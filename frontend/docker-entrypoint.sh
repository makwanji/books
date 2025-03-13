#!/bin/sh
echo "window._env_ = { BACKEND_URL: \"$REACT_APP_BACKEND_URL\" };" >/usr/share/nginx/html/env-config.js
exec "$@"
