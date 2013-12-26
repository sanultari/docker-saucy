#!/usr/bin/env bash

dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
sed -ie "s/\(master\s*:\s*\)salt/\1$SALT_MASTER/g" /etc/salt/minion
sed -ie 's/^#\s*\(master\s*:\)/\1/g' /etc/salt/minion
hostname > /etc/salt/minion_id

service salt-minion start

if [ $# -ne 0 ]
then
	echo 'custom process'
	$@
fi
