#!/usr/bin/python

import sys

inf_name = sys.argv[1]

output_dir = 'raw_data/'

with open(inf_name, 'r') as inf:
  lines = inf.readlines()

for i in range(len(lines) // 2):
  seq_name_line = lines[2 * i]
  seq = lines[2 * i + 1]
  #print(seq_name_line, seq)

  with open(output_dir + seq_name_line[1:-1] + '.fasta', 'w') as of:
    of.write(seq_name_line)
    of.write(seq)
  #if i == 2:
    #break
