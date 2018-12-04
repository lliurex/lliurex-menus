#!/bin/bash
# This script is licensed under GPL v3 or higher
#
# Author : 	Angel Berlanas Vicente
# 				<angel.berlanas@gmail.com>


for f in $( find "$(pwd)/$1" -xtype f| grep -v "/.svn/") ; do 
	echo -n "Working $f "
	rc=0
	cat $f| grep -q "^Name\[qcv\]="|| rc=1
	if [ $rc -eq 0 ] ; then
		echo "Ok"
		rc1=0
		cat $f| grep -q "^Name\[ca_ES.UTF-8@valencia\]="|| rc1=1
		if [ $rc1 -eq 1 ]; then
			echo "ca_ES.UTF-8@valencia not present"
			# Get the qcv Message
			qcv_msg="Name[ca_ES.UTF-8@valencia]=$(cat $f| grep "^Name\[qcv\]="| cut -d "=" -f2)"
			echo "QCV MSG =>>$qcv_msg"
			sed -i "/^Name\[qcv\]/a$qcv_msg" "$f"
		fi
	else
		echo "NO"
	fi
done

for f in $( find "$(pwd)/$1" -xtype f| grep -v "/.svn/") ; do 
	echo -n "Working $f "
	rc=0
	cat $f| grep -q "^Comment\[qcv\]="|| rc=1
	if [ $rc -eq 0 ] ; then
		echo "Ok"
		rc1=0
		cat $f| grep -q "^Comment\[ca_ES.UTF-8@valencia\]="|| rc1=1
		if [ $rc1 -eq 1 ]; then
			echo "ca_ES.UTF-8@valencia not present"
			# Get the qcv Message
			qcv_msg="Comment[ca_ES.UTF-8@valencia]=$(cat $f| grep "^Name\[qcv\]="| cut -d "=" -f2)"
			echo "QCV MSG =>>$qcv_msg"
			sed -i "/^Comment\[qcv\]/a$qcv_msg" "$f"
		fi
	else
		echo "NO"
	fi
done
