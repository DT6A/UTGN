#!/bin/bash

evoNum="42"
rawDir="raw_data/"
outputDir="outputs/"
python2 convert_to_tfrecord.py "$rawDir$1".proteinnetc "$outputDir$1".tfrecord "$evoNum"
