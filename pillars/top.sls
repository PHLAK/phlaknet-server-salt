base:
    '*':
        - data.groups
        - data.monit
        - data.new-relic
        - data.openssh-server
        - data.tarsnap
        - data.unattended-upgrades

    # 'roles:kvm':
    #     - data.kvm

    # 'roles:minecraft':
    #     - minecraft

    'roles:sync':
        - data.btsync

    'roles:voice':
        - data.mumble-server

    'roles:web':
        - data.mysql-server
        - data.nginx
        - data.php
