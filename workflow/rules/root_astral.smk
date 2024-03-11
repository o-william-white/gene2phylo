rule root_astral:
    input:
        tree = "results/astral/output.tree"
    output:
        tree = "results/astral/output.tree.rooted.newick"
    log:
        "logs/root_astral/log.txt"
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
