add_header Access-Control-Allow-Origin *;

location / {
    uwsgi_pass unix:///var/lib/galaxy/uwsgi.sock;
    uwsgi_param UWSGI_SCHEME $scheme;
    include uwsgi_params;
}

location /static {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/static;
    expires 24h;
}

location /static/style {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/static/style/blue;
    expires 24h;
}

location /static/scripts {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/static/scripts;
    expires 24h;
}

location /favicon.ico {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/static/favicon.ico;
}

location /robots.txt {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/static/robots.txt;
}

# Global GIE configuration
location /gie_proxy {
    proxy_pass http://localhost:8800/gie_proxy;
    proxy_redirect off;
}

# Project Jupyter / IPython specific. Other IEs may require their own routes.
location ~ ^/gie_proxy/jupyter/(?<nbtype>[^/]+)/api/kernels(?<rest>.*?)$ {
    proxy_pass http://localhost:8800/gie_proxy/jupyter/$nbtype/api/kernels$rest;
    proxy_redirect off;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
}

location ~ ^/plugins/(?<plug_type>.+?)/(?<vis_name>.+?)/static/(?<static_file>.*?)$ {
    alias {{ galaxy_fs[hostname] }}/galaxy-app/config/plugins/$plug_type/$vis_name/static/$static_file;
}

location /_x_accel_redirect/ {
    internal;
    alias /;
}

