#!/bin/sh

echo "<user username=\"$username\" password=\"$password\" roles=\"manager-gui,admin-gui\"/>" \
  >> /opt/apache-tomcat-9.0.107/conf/tomcat-users.xml

# Start Tomcat
exec /opt/apache-tomcat-9.0.107/bin/catalina.sh run
