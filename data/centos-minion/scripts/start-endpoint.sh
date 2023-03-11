echo "giving master time to create the master key"
sleep 10

#echo "importing master key"

if [ -d /root/.ssh/ ]; then
	echo ".ssh folder exists"
	else
	echo "creating .ssh folder"
	mkdir /root/.ssh/
fi

if [ -f /etc/ssh/ssh_host_rsa_key ]; then
	echo "default ssh keys present"
	else
	echo "default ssh keys missing, regenerating"
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
	ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
        ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
fi

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
/usr/sbin/sshd -D
