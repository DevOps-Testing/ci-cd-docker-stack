#!/usr/bin/env bash

BIN_DIR=$(dirname $0)
. $BIN_DIR/setenv.sh

cd $CONFIG_DIR

# with local time
# NOW=date -u +"%Y-%m-%dT%H:%M:%SZ"
# with offset
NOW=$(date +%Y-%m-%dT%H:%M:%S%z)
mkdir -p $NEXUS_BACKUP_DIR



echo +++ Perfoming Jenkins backup +++
echo Backing up $NEXUS_CONTAINER_NAME ...
docker exec -i $NEXUS_CONTAINER_NAME tar --exclude $JENKINS_HOME/plugins --exclude $JENKINS_HOME/.m2 -cOvj $JENKINS_HOME > "$BACKUP_DIR/$NEXUS_CONTAINER_NAME.tar.bz2"
cp $BACKUP_DIR/$NEXUS_CONTAINER_NAME.tar.bz2 $NEXUS_BACKUP_DIR/$NOW.tar.bz2
echo +++ Jenkins backups done+++
echo

cd $ORIGINAL_WD
