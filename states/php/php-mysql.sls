php-mysql:

    pkg.installed:
        - name: php5-mysql
        - require:
            - pkg: php