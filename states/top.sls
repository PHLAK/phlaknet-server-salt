base:
    '*' :
        - groups
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
    #     - kvm

    'roles:minecraft':
        - openjdk7
        - minecraft

    'roles:plex':
        - plex

    'roles:sync':
        - btsync

    'roles:voice':
        - mumble-server

    'roles:web':
        - nginx
        - mysql
        - php
