openssh-server:

    pkg.installed:
        - name: openssh-server

    service.running:
        - name: ssh
        - enable: true
        - restart: true
        - require:
            - pkg: openssh-server
        - watch::
            - file: {{ salt['pillar.get']('openssh:config') }}

    file.managed:
        - name: {{ salt['pillar.get']('openssh:config') }}
        - source: salt://openssh/files/etc/ssh/sshd_config
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: openssh-server


/etc/monit/conf.d/sshd:
    file.manged:
        - source: salt://openssh-server/files/etc/monit/conf.d/sshd
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: monit
