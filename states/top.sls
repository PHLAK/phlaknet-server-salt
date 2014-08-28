base:
    '*' :
        - management-tools.bwm-ng
        - management-tools.htop
        - management-tools.speedtest-cli
        - monit
        - new-relic
        - openssh-server
        - postfix
        - tarsnap
        - ufw
        - unattended-upgrades

    # 'roles:kvm':
    #     - match: grain
    #     - kvm

    'roles:minecraft':
        - match: grain
        - openjdk7
        - minecraft

    'roles:plex':
        - match: grain
        - plex

    'roles:sync':
        - match: grain
        - btsync

    'roles:voice':
        - match: grain
        - mumble-server

    'roles:web':
        - match: grain
        - nginx
        - mysql
        - php
