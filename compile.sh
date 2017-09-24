#!/bin/bash

set -e

BIN=/tmp/XiuzLegends/bin
mkdir -p $BIN

javac -cp "dist/slf4j-api.jar:dist/mina-core.jar" -d $BIN $(find src -name *.java)
pushd $BIN > /dev/null
jar cvf XiuzLegends.jar net > /dev/null
popd > /dev/null
mv $BIN/XiuzLegends.jar dist/XiuzLegends.jar
rm -rf $BIN
