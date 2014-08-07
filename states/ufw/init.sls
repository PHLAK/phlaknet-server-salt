ufw:

    pkg.installed:
        - name: ufw

    cmd.run:
        - name: sudo ufw --force enable
