include:
    - nginx

btsync:

    pkgrepo.managed:
        - ppa: tuxpoldo/btsync

    pkg.installed:
        - name: btsync
        - refresh: true
        - require:
            - pkgrepo: btsync

    group.present:
        - name: {{ salt['pillar.get']('btsync:group') }}
        - require:
            - pkg: btsync

    user.present:
        - name: {{ salt['pillar.get']('btsync:user') }}
        - shell: /bin/false
        - home: /var/lib/btsync
        - require:
            - pkg: btsync
            - group: btsync

    service.running:
        - enable: true
        - require:
            - pkg: btsync
        - watch:
            - file: {{ salt['pillar.get']('btsync:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('btsync:config_file') }}
        - source: salt://btsync/files/etc/btsync/debconf-default.conf
        - user: btsync
        - group: btsync
        - mode: 400
        - template: jinja
        - require:
            - pkg: btsync

btsync-ufw-rules:
    cmd.run:
        - name: ufw allow 51515
        - timeout: 30
        - shell: /bin/bash
        - require:
            - pkg: btsync
            - pkg: ufw

btsync-dir:
    file.directory:
        - name: {{ salt['pillar.get']('btsync:sync_dir') }}
        - user: {{ salt['pillar.get']('btsync:user') }}
        - group: {{ salt['pillar.get']('btsync:group') }}
        - mode: 664
        - require:
            - pkg: btsync

btsync-ssl:
    cmd.run:
        - name: |
            openssl req -x509 -nodes \
            -days {{ salt['pillar.get']('btsync:ssl:days') }} \
            -newkey rsa:{{ salt['pillar.get']('btsync:ssl:strength') }} \
            -subj "/C=US/ST=Arizona/L=Phoenix/O=PHLAKNET/CN={{ salt['pillar.get']('btsync:vhost:fqdn') }}" \
            -keyout {{ salt['pillar.get']('btsync:ssl:key') }} \
            -out {{ salt['pillar.get']('btsync:ssl:cert') }}
        - timeout: 120
        - shell: /bin/bash
        - unless: test -s {{ salt['pillar.get']('btsync:ssl:key') }} && test -s {{ salt['pillar.get']('btsync:ssl:cert') }}
        - require:
            - file: nginx-ssl-dir

btsync-vhost-available:
    file.managed:
        - name: {{ salt['pillar.get']('btsync:vhost:config') }}
        - source: salt://btsync/files/etc/nginx/sites-available/btsync
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: nginx

btsync-vhost-enabled:
    file.symlink:
        - name: {{ salt['pillar.get']('nginx:dirs:sites_enabled') }}/btsync
        - target: {{ salt['pillar.get']('btsync:vhost:config') }}
        - user: root
        - group: root
        - mode: 644
        - require:
            - file: btsync-vhost-available
            - cmd: btsync-ssl
            - pkg: nginx

btsync-monit-config:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/btsync
        - source: salt://btsync/files/etc/monit/conf.d/btsync
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
