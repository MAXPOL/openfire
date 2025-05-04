# openfire
sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS*
sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS*
sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS*


Install and configuration OPENFIRE

yum install git -y

cd /

git clone https://github.com/MAXPOL/openfire.git

cd openfire

chmod +x openfireInstallCentos7.sh

./openfireInstallCentos7.sh

After full install in browser enter: http://ip_address_server:9090 

Login: admin  | Password: did you enter it when you set it up
