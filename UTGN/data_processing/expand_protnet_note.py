import sys
import pickle
#import numpy as np

def load_pkl(target_path):
  with open(target_path, 'rb') as handle:
    return pickle.load(handle)

raw_dir = 'raw_data/'

protnet_file = sys.argv[1]
coordinates_dict_file = sys.argv[2]

coords = load_pkl(coordinates_dict_file)

with open(raw_dir + protnet_file, 'a') as of:
    ant_coords = coords[protnet_file[:4]]
    #print(ant_coords)
    of.write('[TERTIARY]\n')
    for axis in range(3):
       for coord in ant_coords[:, axis]:
           of.write(str(coord.item()) + ' ')
       of.write('\n')
    of.write('[MASK]\n')
    of.write('+' * (len(ant_coords) // 3) + '\n\n')
