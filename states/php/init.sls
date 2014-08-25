php:

    pkg.installed:
        - name: php5-fpm

    service.running:
        - enable: true
        - require:
            - pkg: php
        - watch:
            - file: {{ salt['pillar.get']('php:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('php:config_file') }}
        - source: salt://php/files/etc/php5/fpm/php.ini
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: php
