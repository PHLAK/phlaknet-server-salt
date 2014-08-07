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
            - file: {{ salt['pillar.get']('openssh:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('openssh:config_file') }}
        - source: salt://openssh-server/files/etc/ssh/sshd_config
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: openssh-server

    cmd.run:
        - name: ufw allow 22
        - timeout: 30
        - shell: /bin/bash
        - require:
            - pkg: ufw
        - onlyif:
            - pkg: openssh-server

{{ salt['pillar.get']('monit:conf_dir') }}/openssh-server:
    file.managed:
        - source: salt://openssh-server/files/etc/monit/conf.d/openssh-server
        - user: root
        - group: root
        - mode: 644
        - templat: jinja
        - onlyif:
            - pkg: monit
