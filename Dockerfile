# Use Nginx to serve static HTML
FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html
COPY NSID.html /usr/share/nginx/html/

# custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
