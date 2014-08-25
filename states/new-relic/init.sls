new-relic:

    pkgrepo.managed:
        - name: deb http://apt.newrelic.com/debian/ newrelic non-free
        - file: /etc/apt/sources.list.d/newrelic.list
        - keyid: 548C16BF
        - keyserver: keyserver.ubuntu.com

    pkg.latest:
        - name: newrelic-sysmond
        - require:
            - pkgrepo: new-relic

    cmd.run:
        - name: nrsysmond-config --set license_key={{ salt['pillar.get']('new-relic:license_key') }}
        - require:
            - pkg: new-relic
        - unless: grep {{ salt['pillar.get']('new-relic:license_key') }} {{ salt['pillar.get']('new-relic:config_file') }}

    service.running:
        - name: newrelic-sysmond
        - enable: true
        - require:
            - pkg: new-relic
            - cmd: new-relic
        # - watch:
        #     - file: {{ salt['pillar.get']('new-relic:config_file') }}

new-relic-monit-config:
    file.managed:
        - name: {{ salt['pillar.get']('monit:conf_dir') }}/new-relic
        - source: salt://btsync/files/etc/monit/conf.d/new-relic
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: monit
