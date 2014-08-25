tarsnap:

    pkg.installed:
        - pkgs:
            - e2fslibs-dev
            - libssl-dev
            - zlib1g-dev

    archive.extracted:
        - name: /tmp/
        - source: {{ salt['pillar.get']('tarsnap:archive:url') }}
        - source_hash: sha256={{ salt['pillar.get']('tarsnap:archive:hash') }}
        - archive_format: tar
        - tar_options: z
        - if_missing: {{ salt['pillar.get']('tarsnap:archive:extract_path') }}

    cmd.run:
        - name: sh configure && make all install clean
        - cwd: {{ salt['pillar.get']('tarsnap:archive:extract_path') }}
        - timeout: 300
        - shell: /bin/sh
        - require:
            - archive: tarsnap
            - pkg: tarsnap
        - unless: test -x /usr/local/bin/tarsnap

    file.managed:
        - name: {{ salt['pillar.get']('tarsnap:config_file') }}
        - source: salt://tarsnap/files/usr/local/etc/tarsnap.conf
        - user: root
        - group: root
        - mode: 644
        - require:
            - cmd: tarsnap
        - template: jinja
