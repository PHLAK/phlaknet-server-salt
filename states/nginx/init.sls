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

{{ salt['pillar.get']('monit:conf_dir') }}/nginx:
    file.managed:
        - source: salt://nginx/files/etc/monit/conf.d/nginx
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
