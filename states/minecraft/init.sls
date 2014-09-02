include:
    - openjdk7

minecraft:

    file.managed:
        - name: /opt/minecraft/minecraft-server.jar
        - source: {{ salt['pillar.get']('minecraft:file:url') }}
        - source_hash: {{ salt['pillar.get']('minecraft:hash_type') }}={{ salt['pillar.get']('minecraft:file:hash') }}
        - user: root
        - group: {{ salt['pillar.get']('minecraft:group') }}
        - mode: 664

    group.present:
        - name: {{ salt['pillar.get]('minecraft:group') }}
        - gid: {{ salt['pillar.get]('minecraft:gid') }}
