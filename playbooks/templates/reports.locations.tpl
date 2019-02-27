 location /reports {
     auth_pam    "Secure Zone";
     auth_pam_service_name   "nginx";
     proxy_pass http://127.0.0.1:9001;
     proxy_set_header   X-Forwarded-Host $host;
     proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
 }

 location /reports/static {
     alias {{ galaxy_fs[hostname] }}/galaxy-app/static;
     expires 24h;
 }

 location /reports/static/style {
     alias {{ galaxy_fs[hostname] }}/galaxy-app/static/style/blue;
     expires 24h;
 }

