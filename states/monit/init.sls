monit:

    pkg.installed:
        - name: monit

    service.running:
        - enable: true
        - reload: true
        - require:
            - pkg: monit
        - watch:
            - file: {{ salt['pillar.get']('monit:config_file') }}

    file.managed:
        - name: {{ salt['pillar.get']('monit:config_file') }}
        - source: salt://monit/files/etc/monit/monitrc
        - user: root
        - group: root
        - mode: 600
        - template: jinja
        - require:
            - pkg: monit

{{ salt['pillar.get']('monit:conf_dir') }}:
    file.directory:
        - user: root
        - group: root
        - mode: 755
        - require:
            - pkg: monit
