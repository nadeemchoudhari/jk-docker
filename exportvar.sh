

echo "HELLO WORLD "
mkdir  ./git-repo

cat /etc/ansible/hosts | grep $SERVER_NAME 

es=$?
echo "es=$es"
if [ $es -eq 0 ];then
 
echo -e "[$SERVER_NAME]\n" >> /etc/ansible/hosts
echo -e "\n $SERVER_NAME ansible_ssh_port=2$JB_HTTP_PORT ansible_ssh_host=$JB_HOST ansible_connection=ssh \n " >> /etc/ansible/hosts

fi

echo JB_HTTP_PORT=$JB_HTTP_PORT > ./git-repo/var.sh
echo JBOSS_HOME=$JBOSS_HOME >> ./git-repo/var.sh
echo JAVA_HOME=$JAVA_HOME >> ./git-repo/var.sh
echo JB_HOST=$JB_HOST >> ./git-repo/var.sh
echo JB_HOST_SHORT_NAME=$JB_HOST_SHORT_NAME >> ./git-repo/var.sh
echo configure_MN_PN=$configure_MN_PN >> ./git-repo/var.sh
echo SERVER_HOME=$SERVER_HOME >> ./git-repo/var.sh
echo SERVER_NAME=$SERVER_NAME >> ./git-repo/var.sh
echo DB_HOST=$DB_HOST >> ./git-repo/var.sh
echo DB_PORT=$DB_PORT >> ./git-repo/var.sh
echo WFLY_TMPLT=$WFLY_TMPLT >> ./git-repo/var.sh
echo BUILD1=$BUILD1 >> ./git-repo/var.sh
echo BUILD2=$BUILD2 >> ./git-repo/var.sh
echo BUILD3=$BUILD3 >> ./git-repo/var.sh
echo BUILD4=$BUILD4 >> ./git-repo/var.sh

