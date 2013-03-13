#/!bin/bash

uname="<username>"
pword="<password>"
env=$1
batchID=$2

echo
echo Environment is: $env

if [ "$env" == "dev" ] || [ "$env" == "stage" ]; then
	env="$env-batch"
else
	env="batch"
fi

if [ "$batchID" == "" ] || [ "$batchID" == null ]; then
	echo Batch ID is not supplied
	exit
fi


echo
echo Batch ID is: $batchID

#Check the status of the batch job
temp="curl https://$uname:$pword@$env.click2mail.com/v1/batches/$batchID"

echo
echo Running:
echo $temp

temp=`curl https://$uname:$pword@$env.click2mail.com/v1/batches/$batchID`

echo $temp
