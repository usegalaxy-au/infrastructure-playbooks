#
# Proftpd sample configuration for SQL-based authentication.
#
# (This is not to be used if you prefer a PAM-based SQL authentication)
#

<IfModule mod_sql.c>
#
# Choose a SQL backend among MySQL or PostgreSQL.
# Both modules are loaded in default configuration, so you have to specify the backend 
# or comment out the unused module in /etc/proftpd/modules.conf.
# Use 'mysql' or 'postgres' as possible values.
#
SQLBackend	postgres
#
SQLEngine on
SQLAuthenticate users
#
# Use both a crypted or plaintext password 
SQLPasswordEngine on
SQLPasswordEncoding hex
SQLAuthTypes SHA1
#
# Use a backend-crypted or a crypted password
#SQLAuthTypes Backend Crypt 
#
# UID GID
SQLDefaultUID	10010
SQLDefaultGID	10010
SQLDefaultHomedir /mnt/ftp/proftp
# Connection 
#SQLConnectInfo proftpd@sql.example.com proftpd_user proftpd_password
SQLConnectInfo galaxy@galaxy-aust-db.genome.edu.au:5962 galaxyftp L8O5EVDRGR
# Query
SQLUserInfo	custom:/LookupGalaxyUser
SQLNamedQuery	LookupGalaxyUser SELECT "email,password,'10010','10010','/mnt/ftp/galaxy_prod/%U','/bin/bash' from galaxy_user where email='%U'"
#
# Describes both users/groups tables
#
#SQLUserInfo users userid passwd uid gid homedir shell
#SQLGroupInfo groups groupname gid members
#
# Logging
SQLLogFile	/var/log/proftpd/proftpd-sql.log
#
</IfModule>

