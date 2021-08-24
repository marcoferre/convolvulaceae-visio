import pandas as pd
import json as json
import re

# read datasets
brm_df = pd.read_csv('data/BRM-emot-submit-val-arousal.csv')

with open('data/imagenet1000_clsidx_to_labels.json') as json_file:
    imagenet_classes = json.load(json_file)

# print header of csv in a 1995 fashion way
with open('data/imagenet-classes-v-a.csv', 'w') as the_file:
    the_file.write('Id,Class,WordBRM,V.Mean.Sum,A.Mean.Sum\n')

# loop through imagenet classes
for key, value in imagenet_classes.items():

    found = 0

    # split class name in single words
    imagenet_words = re.split(', | ', value)

    print("IMAGENET WORD: " + str(key) + " - " + value)

    # loop through each word
    for imagenet_word in imagenet_words:

        # find the first word that match in BRM dataset
        brm_word = brm_df[brm_df['Word'] == imagenet_word]

        # if found print it in the out file interesting parts
        if not brm_word.empty:
            print(brm_word)
            found = 1

            # prepare the line to print
            string = "{0},{1},{2},{3},{4}\n".format(key, value.replace(",", " |"), brm_word['Word'].values[0],
                                                    brm_word['V.Mean.Sum'].values[0], brm_word['A.Mean.Sum'].values[0])
            with open('data/imagenet-classes-v-a.csv', 'a') as the_file:
                the_file.write(string)
            break

    if not found:
        string = "{0}, {1},,,\n".format(key, value.replace(",", ""))
        with open('data/imagenet-classes-v-a.csv', 'a') as the_file:
            the_file.write(string)
