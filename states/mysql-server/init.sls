include:
    - php.php-mysql

mysql-server:

    pkg.installed:
        - name: mysql-server

    service.running:
        - enable: true
        - require:
            - pkg: mysql-server
