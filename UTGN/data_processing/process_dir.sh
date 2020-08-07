#!/bin/bash
rawDir="raw_data"

#i=0
#while read line
#do
#    array[ $i ]="$line"        
#    (( i++ ))
#done < <(ls "$rawDir" | sed -E '/\.fasta\..+/d')

maxProc="6"

for filename in $rawDir/*.fasta; do
    filename=$(echo "$filename" | sed -E "s/$rawDir\///g")
    while [ $(jobs -r | wc -l) -ge "$maxProc" ] ; do sleep 1 ; done
    bash seq_to_tf_train.sh "$filename" &
done
#printf '%s\n' "${array[@]}" | xargs -i --max-procs="$maxProc" bash -c "bash seq_to_tf_train.sh {}"
#wait
echo "FINISHED DIRECTORY PROCESSING"
