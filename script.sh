TIMESTAMP=$(date +"%Y-%m-%d")
deletionDate=$TIMESTAMP
count=2
creationDate=$( echo `date -d "${targetDate} -${count} days" +"%Y-%m-%d"`)
echo "Auto Generate Log files"
find /home/ec2-user/ -type f -name '*.wav' -mtime -1 | xargs -0 -n 1 > deleted-files-$TIMESTAMP.log
echo "Log Generated Successfully"
sed "s/$/\t${creationDate}/" -i /home/ec2-user/deleted-files-$TIMESTAMP.log
sed "s/$/\t${deletionDate}/" -i /home/ec2-user/deleted-files-$TIMESTAMP.log
find /home/ec2-user/ -type f -name '*.wav' -mtime -1 -exec rm {} \;
