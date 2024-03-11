rule root_iqtree:
    input:
        tree = "results/iqtree/{genes}.treefile"
    params:
        outgroup = outgroup
    output:
        tree = "results/iqtree/{genes}.treefile.rooted.newick"
    log:
        "logs/root_iqtree/{genes}.txt"
    conda:
        "../envs/ete3.yaml"
    shell:
        """
        if [ {params.outgroup} == "NA" ]; then
            echo "Outgroup not specified. Leaving as unrooted" > {log}
            cp {input.tree} {output.tree}
        else
            python workflow/scripts/root_newick.py \
                --input {input.tree} \
                --output {output.tree} \
                --outgroup {params.outgroup} &> {log}
        fi
        """
