AuthType=auth/munge
AuthInfo=/var/run/munge/munge.socket.2
DbdHost={{ slurmdbd_hostname }}
StorageHost={{ slurmmysql_hostname }}
StorageLoc=slurm_acct_db
StoragePass={{ mysql_slurm_password }}
StorageType=accounting_storage/mysql
StorageUser={{ mysql_slurm_user }} 
LogFile=/var/log/slurm-llnl/slurmdbd.log
PidFile=/var/run/slurm-llnl/slurmdbd.pid
SlurmUser=slurm

