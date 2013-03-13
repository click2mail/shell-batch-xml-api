#!/bin/bash

configFile="batch-config.ini"

uname=$USERNAME
pword=$PASSWORD

env=$1
batchID=-1				        #Batch ID
jobXML="null"                     	        #Batch XML
jobDOC="null"                      		#Job Doc
temp=""

echo
echo Environment: $env


if [ "$env" == "dev" ] || [ "$env" == "stage" ]; then
	env="$env-batch"
fi

if [ "$env" == "pro" ]; then
	env="batch"
fi


while read LINE
do
	if [[ "$LINE" =~ "xml" ]]; then
		jobXML=${LINE:5}
	fi
	if [[ "$LINE" =~ "pdf" ]]; then
		jobDOC=${LINE:5}
	fi
done < $configFile


jobXML=`echo $jobXML | tr -s " "`
jobDOC=`echo $jobDOC | tr -s " "`

jobXML="@$jobXML"
jobDOC="@$jobDOC"

echo
echo Job XML: $jobXML

echo
echo Job Doc: $jobDOC




#Create batch order and get batch id
temp=`curl -X POST https://$uname:$pword@$env.click2mail.com/v1/batches`

arr=`echo $temp | sed 's/</ /g'`

i=0

for x in $arr
do
	if [ "$i" -eq 11 ]; then
		batchID=$x
	fi
	i=$(($i + 1))
done


echo
batchID=${batchID:3}
echo Batch ID = $batchID



#Upload the batch XML
temp=`curl -X PUT https://$uname:$pword@$env.click2mail.com/v1/batches/$batchID -H "Content-Type: application/xml" --data-binary $jobXML`
echo
echo Response from XML upload: $temp


#Upload PDF
temp=`curl -X PUT https://$uname:$pword@$env.click2mail.com/v1/batches/$batchID -H "Content-Type: application/pdf" --data-binary $jobDOC`

echo
echo Response from PDF upload: $temp


#Submit the job
temp=`curl -X POST https://$uname:$pword@$env.click2mail.com/v1/batches/$batchID`

echo
echo Response after job submit: $temp
