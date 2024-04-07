# Use a lightweight Nginx image
FROM nginx:alpine

# Copy the application files into the container
COPY index.html /usr/share/nginx/html/index.html
# COPY env.js /usr/share/nginx/html/env.js

WORKDIR /usr/share/nginx/html

# Expose port 80
EXPOSE 80
