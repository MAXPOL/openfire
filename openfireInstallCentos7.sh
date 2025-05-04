#!/bin/bash

passwoddb=''

echo "Install OPENFIRE"
echo "Enter new password database:"
read passworddb

sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS*
sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS*
sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS*

firewall-cmd --permanent --add-port=3306/tcp --add-port=5222/tcp --add-port={9090,9091}/{udp,tcp}
firewall-cmd --reload
setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
yum install wget nano -y
wget https://bppk.info/jre8x64.rpm
rpm -ivh jre8x64.rpm
echo -n "export JAVA_HOME=/usr/java/default " >> /etc/profile 

wget https://github.com/igniterealtime/Openfire/releases/download/v4.4.0/openfire-4.4.0-1.x86_64.rpm
rpm -ivh openfire-4.4.0-1.x86_64.rpm

systemctl enable openfire
systemctl start openfire

yum install mariadb-server mariadb mysql-connector-java libldb -y
systemctl enable mariadb
systemctl start mariadb

mysql_secure_installation <<EOF

y
$passworddb
$passworddb
y
n
y
y
EOF

mysql -u root -p$passworddb -e CREATE DATABASE openfire;
mysql -u root -p$passworddb -e GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY '1';
zcat /opt/openfire/resources/database/openfire_mysql.sql| mysql -u user -p$passworddb openfire
echo "Finish!"
