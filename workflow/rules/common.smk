import os
from snakemake.utils import min_version

min_version("8.4.12")

# set configfile
configfile: "config/config.yaml"


# configfile parameters
input_dir = config["input_dir"]
realign = config["realign"]
missing_threshold = config["missing_threshold"]
alignment_trim = config["alignment_trim"]
outgroup = config["outgroup"]
plot_height = config["plot_height"]
plot_width = config["plot_width"]

# paramter checks
if realign != True and realign != False:
    sys.exit("Error: realign must be True or False")
if realign == True:
    if (
        not isinstance(missing_threshold, float)
        or missing_threshold < 0.0
        or missing_threshold > 1.0
    ):
        sys.exit(
            "Error: if realign == True, missing_threshold must be a float between 0.0 and 1.0"
        )
    if alignment_trim not in ["gblocks", "clipkit"]:
        sys.exit(
            "Error: if realign == True, alignment_trim must be 'gblocks' or 'clipkit'"
        )

# get a list of all possible input genes
GENES = []
for file in os.listdir(input_dir):
    if file.endswith(".fasta"):
        g = file.replace(".fasta", "")
        GENES.append(g)
