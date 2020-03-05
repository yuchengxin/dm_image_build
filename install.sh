#!/bin/bash

INSTALL_LANGUAGE=E
SELECT_KEY_PATH=N
SELECT_TIMEZONE=Y
TIMEZONE=21
INSTALL_TYPE=1
INSTALL_PATH=${INSTALL_PATH:-/opt/dmdbms}
CONFIRM_INSTALL_PATH=Y
CONFIRM_INSTALL=Y

# resolve links - $0 may be a softlink
PRG="${0}"

while [ -h "${PRG}" ]; do
  ls=`ls -ld "${PRG}"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "${PRG}"`/"$link"
  fi
done

set -ex

BASEDIR=`dirname ${PRG}`

DM_INSTALL_FLAG_FILE=${BASEDIR}/DM.INSTALL.SUCCESS

function install_quiet(){
${BASEDIR}/DMInstall.bin -i <<EOF
${INSTALL_LANGUAGE}
${SELECT_KEY_PATH}
${SELECT_TIMEZONE}
${TIMEZONE}
${INSTALL_TYPE}
${INSTALL_PATH}
${CONFIRM_INSTALL_PATH}
${CONFIRM_INSTALL}
EOF
cd ${INSTALL_PATH}/bin && ./dminit path=${INSTALL_PATH}/data page_size=16 log_size=2048 case_sensitive=n && cd ${BASEDIR}
}

if [ ! -f $DM_INSTALL_FLAG_FILE ]; then
	install_quiet
	echo $? > ${DM_INSTALL_FLAG_FILE}
fi

# start dm server
cd ${INSTALL_PATH}/bin && ./dmserver path=${INSTALL_PATH}/data/DAMENG/dm.ini


