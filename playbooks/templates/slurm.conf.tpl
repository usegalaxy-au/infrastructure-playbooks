# MANAGEMENT POLICIES
ControlMachine={{ slurmctld_hostname }}
AuthType=auth/munge
CryptoType=crypto/munge
SlurmUser=slurm
SlurmctldTimeout=300
SlurmdTimeout=300
SwitchType=switch/none

# NODE CONFIGURATIONS
NodeName=galaxy-aust-w1 CPUs=16 RealMemory=64422 State=UNKNOWN

# PARTITION CONFIGURATIONS
{% for key, value in partitionNames.iteritems() %}
PartitionName={{ key }} Nodes={{ value }}
{% endfor %}

# ACCOUNTING   
AccountingStorageType=accounting_storage/slurmdbd
AccountingStorageHost={{ slurmmysql_hostname }}
JobAcctGatherType=jobacct_gather/linux
ClusterName={{ clusterName }}

# CONNECTION
SlurmctldPort=6817
SlurmdPort=6818

# DIRECTORIES
JobCheckpointDir=/var/lib/slurm-llnl/job_checkpoint
SlurmdSpoolDir=/var/lib/slurm-llnl/slurmd
StateSaveLocation=/var/lib/slurm-llnl/state_checkpoint

# LOGGING
SlurmctldDebug=debug
SlurmctldLogFile=/var/log/slurm-llnl/slurmctld.log
SlurmdDebug=debug
SlurmdLogFile=/var/log/slurm-llnl/slurmd.log

# STATE INFO
SlurmctldPidFile=/var/run/slurm-llnl/slurmctld.pid
SlurmdPidFile=/var/run/slurm-llnl/slurmd.pid

# SCHEDULING
FastSchedule=1
SchedulerType=sched/backfill
SelectType=select/cons_res
SelectTypeParameters=CR_CPU

# ERROR RECOVERY
ReturnToService=1
