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
        - gid: 120

    user.present:
        - name: {{ salt['pillar.get']('btsync:user') }}
        - shell: /bin/false
        - home: /var/lib/btsync
        - uid: 120
        - gid: 120

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

{{ salt['pillar.get']('monit:conf_dir') }}/btsync:
    file.managed:
        - source: salt://btsync/files/etc/monit/conf.d/btsync
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit

{{ salt['pillar.get']('btsync:sync_dir') }}:
    file.directory:
        - user: {{ salt['pillar.get']('btsync:user') }}
        - group: {{ salt['pillar.get']('btsync:group') }}
        - mode: 664
        - require:
            - pkg: btsync
