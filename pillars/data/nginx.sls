nginx:

    config_file: /etc/nginx/nginx.conf
    init_file: /etc/init.d/nginx
    pid_file: /var/run/nginx.pid

    config:
        user: www-data
        pid_file: /run/nginx.pid
        worker_connections: 1024

    dirs:
        sites_available: /etc/nginx/sites-available
        sites_enabled: /etc/nginx/sites-enabled
        ssl: /etc/nginx/ssl
        web: /var/www
