#!bin/bash

READY=1

if [ $READY -eq 0 ]
        then
                echo "sleeping process"
                sleep infinity
        else
                echo "Starting whatever you need...";

		if [ -f /var/ansible-volume/master_key ]; then
			echo "controller key exists, proceeding"
		else
			echo "Creating ansible controller ssh key"
                	ssh-keygen -t rsa -C "master key" -f /root/.ssh/id_rsa
                        echo "Copying ansible controller ssh key to ansible volume"
			cp -a /root/.ssh/id_rsa /var/ansible-volume/master_key
                        cp -a /root/.ssh/id_rsa.pub /var/ansible-volume/master_key.pub
		fi
		echo "starting sshd"
                /usr/sbin/sshd -D
fi

