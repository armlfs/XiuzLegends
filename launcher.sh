#!/bin/bash

trap 'pkill -P $$' SIGINT SIGTERM

export CLASSPATH='.:dist/XiuzSource.jar:dist/mina-core.jar:dist/slf4j-api.jar:dist/slf4j-jdk14.jar:dist/mysql-connector-java-bin.jar'

read -r -d '' PARAMS <<'EOF'
-Dnet.sf.odinms.recvops=recvops.properties
-Dnet.sf.odinms.sendops=sendops.properties
-Dnet.sf.odinms.wzpath=wz/
-Dnet.sf.odinms.login.config=login.properties
-Dnet.sf.odinms.channel.config=channel.properties
-Djavax.net.ssl.keyStore=filename.keystore
-Djavax.net.ssl.keyStorePassword=passwd
-Djavax.net.ssl.trustStore=filename.keystore
-Djavax.net.ssl.trustStorePassword=passwd
EOF

java $PARAMS net.sf.odinms.net.world.WorldServer &
sleep .1
java $PARAMS net.sf.odinms.net.login.LoginServer &
sleep .1
java $PARAMS net.sf.odinms.net.channel.ChannelServer &
wait
