mumble-server:

    config_file: /etc/mumble-server.ini
    init_file: /etc/init.d/mumble-server
    log_file: /var/log/mumble-server/mumble-server.log
    pid_file: /var/run/mumble-server/mumble-server.pid

    config:
        database: /var/lib/mumble-server/mumble-server.sqlite
        welcome_text: "<h4 style='background-color: #CFC'>Welcome to the PHLAKNET VoiceCom server!</h4>Only the lobby and AFK channels are freely accessible. In order to access specific game channels your account must be registered.<br/><div style='background-color: #FCC; font-weight: bold;'>To register your account:</div><ol><li>Configure -&gt; Certificate Wizard</li><li>Create a new certificate</li><li><b>Restart Mumble!!!</b></li><li>Self -> Register</li></ol>"
        port: 64738
        host: voice.phlak.net
        password: T@c0_Bu3n0
        bandwidth: 101000
        users: 100
        opus_threshold: 0
        channel_nesting_limit: 5
        textmessagelength: false
        imagemessagelength: false
        allowhtml: false
        logdays: 0
        register:
            name: PHLAKNET
            url: false
            hostname: false
        ssl:
            cert: /etc/ssl/mumble-server/mumble-server.crt
            key: /etc/ssl/mumble-server/mumble-server.key
        uname: mumble-server
        cert_required: true
        sendversion: false
        suggestversion: 1.2.5
        suggestPushToTalk: true
