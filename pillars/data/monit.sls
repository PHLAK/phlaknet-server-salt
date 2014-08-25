monit:

    config_file: /etc/monit/monitrc

    conf_dir: /etc/monit/conf.d

    config:
        daemon_interval: 60
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
        include_path: {{ salt['pillar.get']('monit:conf_dir') }}/*
