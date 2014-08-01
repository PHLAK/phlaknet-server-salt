monit:

    config_file: /etc/monit/monitrc

    config:
        daemon_interval: 120
        files:
            log: /var/log/monit.log
            id: /var/lib/monit/id
            state: /var/lib/monit/state
        mailserver:
            host: localhost
            timeout: 15
        alert_email: Chris@ChrisKankiewicz.com
        eventqueue:
            basedir: /var/lib/monit/events
            slots: 100
        httpd:
            port: 2812
            groups:
                - "@webdev"
        include_path: /etc/monit/conf.d/*

    conf_dir: /etc/monit/conf.d/
