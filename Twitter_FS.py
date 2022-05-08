# Import required libraries
# --max-results 100 
import os
import sys
import pandas as pd
from pandas.io.json import json_normalize
import warnings
warnings.filterwarnings('ignore')

# Get command line arguments for file names and timeframe
args = list(sys.argv)
since = args[1]
until = args[2]
file_suffix = args[3]
# Set file names
raw_tweets_file = file_suffix+ ".json"


# Run snscrape in CLI to get tweets
search_term = ""
cmd = "snscrape --progress --jsonl twitter-search 'since:" + since + " until:" + until + " near:\"New York City\" lang:en' > " + raw_tweets_file
os.system(cmd)
    
# Print JSON file done
#print(cmd)
print("Json file done")
