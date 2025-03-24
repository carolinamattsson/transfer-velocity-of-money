#!/bin/bash

DATA='<path>/Sarafu2021_UKDS'
FOLLOW='<path>/follow-the-money'

# Remove transactions directly between system-run accounts to avoid them appreading as user accounts
cut -d, -f1-6 $DATA/sarafu_xDAI/sarafu_txns_20200125-20210615.csv | grep -vF "0xBDB3Bc887C3b70586BC25D04d89eC802b897fC5F,0xEDA5C9B75Fdb3B9bdAB987A704632280Cf93084F" | grep -vF "0xBDB3Bc887C3b70586BC25D04d89eC802b897fC5F,0xBDB3Bc887C3b70586BC25D04d89eC802b897fC5F" > $DATA/transactions/sarafu_txns.csv

# Run follow-the-money, with pairwise trajectories and a reasonable value for the smallest tracked amount
python $FOLLOW/follow_the_money.py $DATA/transactions/sarafu_txns.csv $DATA/transactions/sarafu_config.json $DATA/trajectories --prefix "sarafu_" --mixed --no_balance --pairwise --smallest 0.01

# Run the analysis script to output neat duration files (one duration per line) with upper or lower bounds for too-small pairs
   # observed durations and an upper bound on the untracked pairs
python $FOLLOW/analysis/trj_durations.py $DATA/trajectories/sarafu_nbal_pairs_mixed.csv $DATA/durations/ --prefix "sarafu_" --suffix "_max" --column all --timewindow_beg "2020-01-25 00:00:00.000000" --timeformat "%Y-%m-%d %H:%M:%S.%f"
   # observed durations and a lower bound on the untracked pairs
python $FOLLOW/analysis/trj_durations.py $DATA/trajectories/sarafu_nbal_pairs_mixed.csv $DATA/durations/ --prefix "sarafu_" --suffix "_min" --column all --timeformat "%Y-%m-%d %H:%M:%S.%f"
