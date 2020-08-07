#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Sequence file is required"
  exit 1
fi

sequenceFile="$1"
fastaDatabase="proteinnet7"
seqName=$(echo "$sequenceFile" | sed -E "s/\..*//g")
rawDir="raw_data/"

#echo "$seqName"

bash jackhmmer.sh "$rawDir$sequenceFile" "$fastaDatabase"
python convert_to_proteinnet.py "$rawDir$sequenceFile"

#python convert_to_tfrecord.py <sequenceFile>.proteinnet <sequenceFile>.tfrecord 42


#find "$rawDataDir" -type f -name '*.*.*' -delete
