{% for group, data in salt['pillar.get']('groups').iteritems() %}

    {{ group }}:
        group.present:
            - gid: {{ data.gid }}

{% endfor %}
