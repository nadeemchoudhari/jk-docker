

source ./git-repo/var.sh

varfile=/etc/ansible/host_vars/$JB_HOST/var.yml
varfile2=/etc/ansible/host_vars/$SERVER_NAME/var.yml
mkdir -p /etc/ansible/host_vars/$SERVER_NAME/
mkdir -p /etc/ansible/host_vars/$JB_HOST/
echo --- > $varfile
echo --- > $varfile2
echo configure_MN_PN : $configure_MN_PN >> $varfile
echo JB_HTTP_PORT: $JB_HTTP_PORT >>  $varfile
JB_HTTPS_PORT=`expr $JB_HTTP_PORT + 1`
JB_TS_RECOVERY_PORT=`expr $JB_HTTPS_PORT + 1 `
JB_TS_STATUS_PORT=`expr $JB_TS_RECOVERY_PORT + 1 `
JB_MANAGEMENT_HTTP_PORT=`expr $JB_TS_STATUS_PORT + 1`
PN_HOME=` echo $SERVER_HOME_pn `
DB_NAME=`echo $SERVER_NAME |  tr /a-z/ /A-Z/ `
echo PN_HOME: $PN_HOME >> $varfile
echo JB_HTTPS_PORT: $JB_HTTPS_PORT >> $varfile
echo JB_TS_RECOVERY_PORT: $JB_TS_RECOVERY_PORT >> $varfile
echo JB_TS_STATUS_PORT: $JB_TS_STATUS_PORT >> $varfile
echo JB_MANAGEMENT_HTTP_PORT: $JB_MANAGEMENT_HTTP_PORT >> $varfile
echo JBOSS_HOME: $JBOSS_HOME >>  $varfile
echo JAVA_HOME: $JAVA_HOME >> $varfile
echo JB_HOST: $JB_HOST >> $varfile
echo JB_HOST_SHORT_NAME: $JB_HOST_SHORT_NAME >> $varfile
echo SERVER_HOME: $SERVER_HOME >> $varfile
echo SERVER_NAME: $SERVER_NAME >> $varfile2
echo DB_HOST: $DB_HOST >> $varfile
echo DB_NAME: $DB_NAME >> $varfile
echo DB_PORT: $DB_PORT >> $varfile
echo WFLY_TMPLT: $WFLY_TMPLT >> $varfile
echo BUILD1: $BUILD1 >> $varfile
echo BUILD2: $BUILD2 >> $varfile
echo BUILD3: $BUILD3 >> $varfile
echo BUILD4: $BUILD4 >> $varfile

ansible-playbook -vvv /etc/ansible/deploy.yml --extra-vars "host=$JB_HOST"

echo " This is executed by Jenis [ SUCCESS " > out.txt

echo " BUILD SUCCESSFUL "



