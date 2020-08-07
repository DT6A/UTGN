#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Sequence file is required"
  exit 1
fi

sequenceFile="$1"
rawDir="raw_data/"
dictFile="ant_coords_changed.pkl"

#echo "$seqName"

echo "$1 generating PSSM"
bash seq_to_protnet_pred.sh "$sequenceFile"
echo "$1 adding tertiary structure"
head -n -1 "$rawDir$sequenceFile.proteinnet" > "$rawDir$sequenceFile.proteinnetc"
python expand_protnet_note.py "$sequenceFile.proteinnetc" "$dictFile"
#python convert_to_tfrecord.py <sequenceFile>.proteinnet <sequenceFile>.tfrecord 42


#find "$rawDataDir" -type f -name '*.*.*' -delete
