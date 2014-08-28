include:
    - openjdk7

minecraft:

    file.managed:
        - name: /opt/minecraft/minecraft-server.jar
        - source: {{ salt['pillar.get']('minecraft:file:url') }}
        - source_hash: sha256={{ salt['pillar.get']('minecraft:file:hash') }}
        - user: root
        - group: minecraft
        - mode: 775

    group.present:
        - name: minecraft
        - gid: 500
