rule root_iqtree_partitioned:
    input:
        tree = "results/iqtree_partitioned/output.treefile"
    output:
        tree = "results/iqtree_partitioned/output.treefile.rooted.newick"
    log:
        "logs/root_iqtree_partitioned/log.txt"
    conda:
        "../envs/ete3.yaml"
    shell:
        """
        if [ {outgroup} == "NA" ]; then
            echo "Outgroup not specified. Leaving as unrooted" > {log}
            cp {input.tree} {output.tree}
        else
            python workflow/scripts/root_newick.py \
                 --input {input.tree} \
                 --output {output.tree} \
                 --outgroup {outgroup} &> {log}
        fi
        """
