include:
    - management-tools.python-pip

speedtest-cli:

    pip.installed:
        - name: speedtest-cli
        - require:
            - pkg: python-pip
