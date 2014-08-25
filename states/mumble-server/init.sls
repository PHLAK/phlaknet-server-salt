include:
    - monit

mumble-server:

    pkg.installed:
        - name: mumble-server

    service.running:
        - enable: true
        - require:
            - pkg: mumble-server
        - watch:
            - file: {{ salt['pillar.get']('mumble-server:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('mumble-server:config_file') }}
        - source: salt://mumble-server/files/etc/mumble-server.ini
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: mumble-server

mumble-server-monit-conf:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/mumble-server
        - source: salt://mumble-server/files/etc/monit/conf.d/mumble-server
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
