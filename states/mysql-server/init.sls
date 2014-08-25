mysql-server:

    pkg.installed:
        - name: mysql-server

    service.running:
        - enable: true
        - require:
            - pkg: mysql-server

mysql-server-monit-config:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/mysql-server
        - source: salt://btsync/files/etc/monit/conf.d/mysql-server
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
