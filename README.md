## Bootstraping a Sync Server

  1. [Install Salt](http://docs.saltstack.com/en/latest/topics/installation/index.html)

  2. Clone this repo to `/srv/salt`

        $ git clone git@github.com:PHLAK/phlaknet-sync-server.git /srv/salt

  3. Configure the minion

        $ sudo cp /etc/salt/minion /etc/salt/minon.bak
        $ sudo cp /srv/salt/minion.conf /etc/salt/minion
