#!/bin/bash


export DEST=10.0.2.15
export BASE=flasktest
export ARTIFACT="$BASE.tar.gz"
export DEST_FOLDER=/tmp

case "$1" in
  build)
	tar -czvf $ARTIFACT flasktest
	;;
  test_connection)
	ssh root@$DEST exit
	if [[ $? == 0 ]]; then
		echo "Connection OK"
		exit 0
	else
		echo "Connection FAIL"
		exit 255
	fi
	;;
  copy)
	scp $ARTIFACT root@$DEST:$DEST_FOLDER/
	;;

  extract)
	ssh root@$DEST "rm -fr $DEST_FOLDER/$BASE"
	ssh root@$DEST "tar -zxvf $DEST_FOLDER/$ARTIFACT -C $DEST_FOLDER/"
	;;
  setup)
	ssh root@$DEST "/usr/local/bin/pip3 install venv"
	;;
esac
