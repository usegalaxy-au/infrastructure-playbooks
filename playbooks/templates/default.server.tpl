server {
    listen 80; 
    return 301 https://$host$request_uri;
}   

server {
    listen                  443 ssl;
    client_max_body_size    10G;
    proxy_read_timeout      1200s;

    # Enable HSTS
    add_header Strict-Transport-Security "max-age=15552000; includeSubdomains";

    ssl on; 
    ssl_certificate         /etc/letsencrypt/live/{{ hostname }}_{{ domainname }}/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/{{ hostname }}_{{ domainname }}/privkey.pem;

    # allowable SSL protocols
    ssl_protocols           TLSv1 TLSv1.1 TLSv1.2;

    # use secure ciphers
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA:ECDHE-ECDSA-AES128-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA256;
    ssl_dhparam /etc/ssl/certs/dhparam.pem;
    ssl_prefer_server_ciphers on; 

    # enable session reuse
    ssl_session_cache shared:SSL:8m;
    ssl_session_timeout 5m; 

    # OCSP stapling
    ssl_stapling on; 
    ssl_stapling_verify on; 
    ssl_trusted_certificate /etc/letsencrypt/live/{{ hostname }}_{{ domainname }}/chain.pem;

    include /etc/nginx/sites-enabled/*.locations;
}   

