#!/bin/bash
#source /etc/profile.d/z_hpc.sh
#export TOOLS_SHARED=/tools_shared/                                                                                                                                                                                                           
#export HPCTK_HOME=/mnt/opt/hpctk/
#$HPCTK_HOME/scripts/bash_users_centos7.sh

#echo "source /etc/profile.d/z_hpc.sh" >> $SGE_JOB_SPOOL_DIR/environment

echo "---Running Prolog Script---"

#echo "HELLO" 

#TMPDIR="/mnt/gpfs/tmp/uge/${JOB_ID}.${SGE_TASK_ID}.${QUEUE}"
#mkdir -p $TMPDIR

echo "QUEUE=${QUEUE}"
echo "TMPDIR=${TMPDIR}"
echo "JOB_ID=${JOB_ID}"
echo "SGE_TASK_ID=${SGE_TASK_ID}"
echo "SGE_O_WORKDIR=${SGE_O_WORKDIR}"
echo "SGE_O_HOME=${SGE_O_HOME}"
echo "HOSTNAME=${HOSTNAME}"
echo "pe_hostfile ${pe_hostfile}"
echo "PE_HOSTFILE=`cat $PE_HOSTFILE`"
echo "PE_SLOTS=$PE_SLOTS"
echo "SLOTS=${NSLOTS}"

echo "---End Prolog Script---"

