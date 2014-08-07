btsync:

    user: btsync
    group: btsync

    config_file: /etc/btsync/debconf-default.conf
    init_file: /etc/init.d/btsync
    pid_file: /var/lib/btsync/sync.pid

    config:
        device_name: PHLAKNET Sync Server
        storage_path: /var/lib/btsync
        listening_port: 51515
        check_for_updates: 'false'
        use_upnp: 'false'
        download_limit: 0
        upload_limit: 0
        disk_low_priority: 'true'
        lan_encrypt_data: 'true'
        lan_use_tcp: 'false'
        rate_limit_local_peers: 'false'
        folder_rescan_interval: 600
        webui:
            listen_address: 0.0.0.0
            listen_port: 5151
            login: chris
            password: Sup3r_S3cr3t_P@ssw0rd

    sync_dir: /srv/sync

    ssl:
        days: 3652
        strength: 4096
        cert: {{ salt['pillar.get']('nginx:dirs:ssl') }}/btsync.crt
        key: {{ salt['pillar.get']('nginx:dirs:ssl') }}/btsync.key

    vhost:
        config: {{ salt['pillar.get']('nginx:dirs:sites_available') }}/btsync
        fqdn: sync.HOSTNAME.phlak.net
