unattended-upgrades:

    pkg.installed:
        - name: unattended-upgrades

    service.running:
        - enable: true
        - require:
            - pkg: unattended-upgrades

{{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/10periodic:
    file.managed:
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/10periodic
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: unattended-upgrades

{{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/20auto-upgrades:
    file.managed:
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/20auto-upgrades
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: unattended-upgrades

{{ salt['pillar.get']('unattended-upgrades:conf_dir') }}/50unattended-upgrades:
    file.managed:
        - source: salt://unattended-upgrades/files/etc/apt/apt.conf.d/50unattended-upgrades
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: unattended-upgrades

# {{ salt['pillar.get']('monit:conf_dir') }}/unattended-upgrades:
#     file.managed:
#         - source: salt://unattended-upgrades/files/etc/monit/conf.d/unattended-upgrades
#         - user: root
#         - group: root
#         - mode: 644
#         - require:
#             - pkg: monit
