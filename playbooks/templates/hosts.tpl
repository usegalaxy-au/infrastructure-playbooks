127.0.0.1	localhost

# The following lines are desirable for IPv6 capable hosts
::1	localhost	ip6-localhost	ip6-loopback
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
127.0.1.1	ubuntu
127.0.1.1	{{ hostname }}.novalocal	{{ hostname }}

# [DNB 14-Nov-2018] Added via ansible
{{ ga_services_ip }} galaxy-aust-services galaxy-aust-services.{{ domainname }}
{{ ga_ftp_ip }} galaxy-aust-ftp galaxy-aust-ftp.{{ domainname }}
{{ ga_dev_ip }} galaxy-aust-dev galaxy-aust-dev.{{ domainname }}
{{ ga_prod_ip }} galaxy-aust-prod galaxy-aust-prod.{{ domainname }}
{{ ga_w1_ip }} galaxy-aust-w1 galaxy-aust-w1.{{ domainname }}
