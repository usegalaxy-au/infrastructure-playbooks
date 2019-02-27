{% for key, value in galaxy_fs.iteritems() %}
{{ value }} -rw,nfsvers=3,hard,intr,bg,nosuid,nodev,timeo=15,retrans=5 {{ ga_services_ip }}:{{ nfs_export_dirs[key] }}
{% endfor %}
