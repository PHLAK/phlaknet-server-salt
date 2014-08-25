unattended-upgrades:

    pkg.installed:
        - name: unattended-upgrades

    service.running:
        - enable: true
        - require:
            - pkg: unattended-upgrades
            - file: unattended-upgrades-10periodic
            - file: unattended-upgrades-20auto-upgrades
            - file: unattended-upgrades-50unattended-upgrades

unattended-upgrades-10periodic:
    file.managed:
        - name: {{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/10periodic
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/10periodic
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: unattended-upgrades

unattended-upgrades-20auto-upgrades:
    file.managed:
        - name: {{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/20auto-upgrades
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/20auto-upgrades
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: unattended-upgrades

unattended-upgrades-50unattended-upgrades:
    file.managed:
        - name: {{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/50unattended-upgrades
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/50unattended-upgrades
        - user: root
        - group: root
        - mode: 644
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
