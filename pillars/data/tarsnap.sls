tarsnap:

    archive:
        url: https://www.tarsnap.com/download/tarsnap-autoconf-1.0.35.tgz
        hash: 6c9f6756bc43bc225b842f7e3a0ec7204e0cf606e10559d27704e1cc33098c9a
        extract_path: /tmp/tarsnap-autoconf-1.0.35/

    config_file: /usr/local/etc/tarsnap.conf

    config:
        cachedir: /usr/local/tarsnap-cache
        keyfile: /root/tarsnap.key
        nodump: true
        print-stats: true
        checkpoint-bytes: 1G
        aggressive-networking: false
        exclude: false
        include: false
        lowmem: false
        verylowmem: false
        snaptime: false
