# domain: lolsack.com
# public: /home/scanf/web/lolsack.com
server {
	listen 80 default_server; # catch em all
	listen [::]:80;

	server_name lolsack.com;

	root /home/scanf/web/lolsack.com/public;
	index index.html;
	error_log  /home/scanf/web/lolsack.com/log/error.log;
	access_log  /home/scanf/web/lolsack.com/log/access.log;


	location / {
		try_files $uri $uri/ =404;
	}

	location ~ /.well-known {
                allow all;
        }
}
