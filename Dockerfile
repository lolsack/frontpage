FROM nginx

# Environment variables
ENV APP_NAME "lolsack.com"
ENV APP_ROOT "/home/scanf/web/$APP_NAME"

# Copy configuraton files
ADD conf/lolsack.com /etc/nginx/conf.d/$APP_NAME.conf

# Clone root directory
RUN mkdir -pv $APP_ROOT/log
ADD index.html $APP_ROOT/
ADD Roflcopter.gif $APP_ROOT/
ADD style $APP_ROOT/

# Tell the world about our port
EXPOSE 80
