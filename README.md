# The Transfer Velocity of Money

This repository demonstrates a new methodology for estimating the transfer velocity of money using transaction data recorded by real-world payment systems. This is implemented for Sarafu, a small digital community currency active in Kenya from transactions recorded between 25 January 2020 and 15 June 2021. We apply a computational technique to measure the durations for which funds were held in individual accounts, and share code that computes the transfer velocity of money from its inverse.

This serves as the replication code and supplementary material for: 

Mattsson, C. E. S., Luedtke, A., & Takes, F. W. (2023). Inverse estimation of the transfer velocity of money (arXiv:2209.01512). https://doi.org/10.48550/arXiv.2209.01512

### Downloading the data

The Sarafu CIC 2020–2021 dataset is available via the UK Data Service (UKDS) ReShare platform and has been suitably documented (Mattsson et al., 2022; https://reshare.ukdataservice.ac.uk/855142/). The dataset is “safeguarded”, meaning that access is limited to those who have registered with the UKDS and re-use is constrained by the UKDS End User License (EUL). Seeking to re-identify individuals is explicitly prohibited.
This page allows you to apply for an account: https://beta.ukdataservice.ac.uk/myaccount/credentials. Check the box with "My organisation is not listed, I need to request a UK Data Service username.” and follow the instructions.

To reproduce our analysis, please download the original data and update the `$DATA/sarafu_xDAI` directory.

### Trajectory extraction

Funds can be systematically traced through individual accounts, from transaction to transaction, and this reveals the durations for which funds were held. This technique is called "trajectory extraction" and we do it using open-source software available at https://github.com/carolinamattsson/follow-the-money. 

To reproduce our analysis, please download a copy of this repository.

### Empirical holding times

The bash script `follow.sh` obtains empirical holding times from the Sarafu transaction records. 
It performs this list of tasks:

1. Define the filepaths to the $DATA directory and the `follow-the-money` repository.
2. A basic pre-processing step, sending output to `$DATA/transactions/`.
3. Performing pairwise trajectory extraction, sending output to `$DATA/trajectories/`.
4. Produce datasets of empirical holding times, sending output to `$DATA/durations/`.

In addition to the transaction dataset, trajectory extraction requires an input file specifying the relevant system parameters. These are encapsulated in `transactions/sarafu_config.json`. 

The following flags are used in extracting trajectories:
* `--no_balance` is used because the Sarafu dataset is complete and accounts started off empty
* `--pairwise` traces in-transactions to out-transactions within each account, but not between accounts
* `--mixed` refers to the allocation heuristic, whereby all possible pairs are considered
* `--smallest 0.01` means to stop keeping track when pairs involve less than 0.01 Sarafu

The final step produces two neat datasets of empirical holding times, treating the small untracked pairs in two different ways. The first uses the creation of the system to provide an upper bound on each untracked duration (`--timewindow_beg "2020-01-25 00:00:00.000000"`). The second uses the moment funds became untracked as a lower bound on each untracked duration. This lets us quantify the measurement uncertainty introduced by the size limit in tracking; at 0.01 Sarafu this is truly negligible. 

For further details, please consult our implementation section, the referenced papers, the `--help` documentation, and the careful explanations of the examples in the `follow-the-money` repository.

To reproduce our analysis, please update the filepaths and run `follow.sh` in the command line:
    
    bash follow.sh

### Tables and plots

To reproduce our analysis, please open `velocity.ipynb` as a python notebook, update the filepaths, and run.

### References

* Mattsson, C. E. S., Luedtke, A., & Takes, F. W. (2023). Inverse estimation of the transfer velocity of money (arXiv:2209.01512). https://doi.org/10.48550/arXiv.2209.01512

* Mattsson, C. E. S., Criscione, T., & Ruddick, W. O. (2022). Sarafu Community Inclusion Currency 2020-2021. Scientific Data, 9(426). https://doi.org/10.1038/s41597-022-01539-4

* Mattsson, C. E. S., & Takes, F. W. (2021). Trajectories through temporal networks. Applied Network Science, 6(35), 1–31. https://doi.org/10.1007/s41109-021-00374-7.

