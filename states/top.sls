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

    # 'roles:minecraft':
    #     - openjdk
    #     - minecraft

    'roles:sync':
        - btsync

    'roles:voice':
        - mumble

    'roles:web':
        - nginx
        - mysql
        - php
