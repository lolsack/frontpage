FROM alpine

# Fetch dependencies
RUN apk update
RUN apk add --update nginx git

# Set hostname
RUN hostnamectl set-hostname lolsack
RUN echo "127.0.1.1       lolsack" | sudo tee -a /etc/hosts

# Copy configuraton files
ADD conf/lolsack.com /etc/nginx/sites-enabled/lolsack.com
ADD ln -s /etc/nginx/sites-enabled/lolsack.com /etc/nginx/sites-available/lolsack.com

# Clone root directory
RUN git clone https://github.com/scanf/lolsack.com.git /home/scanf/web/lolsack.com
RUN mkdir -pv /home/scanf/web/lolsack.com/log

# Get web server up
RUN systemctl enable nginx
RUN systemctl start nginx

# Tell the world about our port
EXPOSE 80
