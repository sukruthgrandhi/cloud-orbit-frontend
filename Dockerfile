# Use a lightweight Nginx image
FROM nginx:alpine

# Copy the application files into the container
COPY index.html /usr/share/nginx/html/frontend/index.html

# Expose port 80
EXPOSE 80
