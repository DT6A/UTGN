#!/bin/bash

echo "$1 processing"
bash seq_to_protnet_train.sh "$1"
echo "$1 converting to tfrecord"
bash prot_net_to_tf.sh "$1"
echo "$1 finished"
