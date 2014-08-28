include:
    - monit

unattended-upgrades:

    pkg.installed:
        - name: unattended-upgrades

    service.running:
        - enable: true
        - require:
            - pkg: unattended-upgrades
            - file: unattended-upgrades-apt-conf-files
        - watch:
            - file: unattended-upgrades-apt-conf-files

unattended-upgrades-apt-conf-files:
    file.recurse:
        - name: {{ salt['pillar.get']('unattended-upgrades:conf_dir') }}
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d
        - user: root
        - group: root
        - file_mode: 644
        - require:
            - pkg: unattended-upgrades

unattended-upgrades-monit-config:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/unattended-upgrades
        - source: salt://unattended-upgrades/files/etc/monit/conf.d/unattended-upgrades
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
