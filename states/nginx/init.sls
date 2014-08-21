nginx:

    pkg.installed:
        - name: nginx

    service.running:
        - enable: true
        - reload: true
        - require:
            - pkg: nginx
        - watch:
            - file: {{ salt['pillar.get']('nginx:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('nginx:config_file') }}
        - source: salt://nginx/files/etc/nginx/nginx.conf
        - user: root
        - group: root
        - mode: 644
        - template: jinja

    cmd.run:
        - name: ufw allow 80 && ufw allow 443
        - timeout: 30
        - shell: /bin/bash
        - require:
            - pkg: ufw
        - onlyif:
            - pkg: nginx

nginx-sites-available-dir:
    file.directory:
        - name: {{ salt['pillar.get']('nginx:dirs:sites_available') }}
        - user: root
        - group: root
        - mode: 755
        - require:
            - pkg: nginx

nginx-sites-enabled-dir:
    file.directory:
        - name: {{ salt['pillar.get']('nginx:dirs:sites_enabled') }}
        - user: root
        - group: root
        - mode: 755
        - require:
            - file: nginx-sites-available-dir

{{ salt['pillar.get']('nginx:dirs:sites_enabled') }}/default:
    file.absent

nginx-ssl-dir:
    file.directory:
        - name: {{ salt['pillar.get']('nginx:dirs:ssl') }}
        - user: root
        - group: root
        - mode: 755
        - require:
            - pkg: nginx

nginx-monit-conf:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/nginx
        - source: salt://nginx/files/etc/monit/conf.d/nginx
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - onlyif:
            - pkg: monit
