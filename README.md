# openfire

Install and configuration OPENFIRE

yum install git -y

cd /

git clone https://github.com/MAXPOL/openfire.git

cd openfire

chmod +x openfireInstallCentos7.sh

./openfireInstallCentos7.sh

After full install in browser enter: http://ip_address_server:9090 

Configurationd DB: MYSQL: jdbc:mysql://127.0.0.1:3306/openfire?rewriteBatchedStatements=true&characterEncoding=UTF-8&characterSetResults=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC

Login: admin  | Password: did you enter it when you set it up
