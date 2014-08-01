nginx:

    config_file: /etc/nginx/nginx.conf

    monit:
        pid_file: /var/run/nginx.pid
        init_file: /etc/init.d/nginx
