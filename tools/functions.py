import pandas as pd
import numpy as np
import scipy.spatial

#################################################################################
#FIND CLASSES
# preprocessing before calling the function

brm_df = pd.read_csv('class-to-val-arousal-mapper/data/imagenet-classes-v-a.csv')
brm_df_drop = brm_df.drop(columns=['Id','Class', 'WordBRM'])

brm_arr = brm_df_drop.to_numpy()


def find_classes(valence, arousal, length, np_dataset, df_dataset):
    tree = scipy.spatial.KDTree(np_dataset)
    distance, brm_indices = tree.query([valence, arousal], length)
    return df_dataset.values[brm_indices]

#################################################################################

# ex
print(find_classes(5, 6, 5, brm_arr, brm_df))
