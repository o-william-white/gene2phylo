rule astral_cat_input:
    input:
        tree=expand("results/iqtree/{gene}.treefile", gene=GENES),
    output:
        input_trees="results/astral/input_trees.tree",
    log:
        "logs/astral/log.txt",
    conda:
        "../envs/astral.yaml"
    shell:
        """
        cat {input.tree} > {output.input_trees} 2> {log}
        """
