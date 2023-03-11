echo "giving master time to create the master key"
sleep 10

#echo "importing master key"
if [ -f /root/.ssh/master_key_imported ]; then
	echo "controller key exists, proceeding"
	else
	echo "importing ansible controller ssh key"
	cat /var/ansible-volume/master_key.pub >> /root/.ssh/authorized_keys
	touch /root/.ssh/master_key_imported
fi

#echo "sleep"
#sleep infinity

echo "starting sshd"
mkdir /var/run/sshd
/usr/sbin/sshd -D
