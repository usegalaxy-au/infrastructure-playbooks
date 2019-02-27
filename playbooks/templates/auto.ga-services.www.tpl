{{ galaxy_fs[hostname] }} -rw,nfsvers=3,hard,intr,bg,nosuid,nodev,timeo=15,retrans=5 {{ ga_services_ip }}:{{ nfs_export_dirs[hostname] }}
{{ ftp_dirs[hostname] }} -rw,nfsvers=3,hard,intr,bg,nosuid,nodev,timeo=15,retrans=5 {{ ga_ftp_ip }}:{{ ftp_dirs[hostname] }} 
