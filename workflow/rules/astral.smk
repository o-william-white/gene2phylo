rule astral:
    input:
        tree = "results/astral/input_trees.tree"
    output:
        tree = "results/astral/output.tree"
    log:
        "logs/astral/log.txt"
    conda:
        "../envs/astral.yaml"
    shell:
        """
        (java -jar $CONDA_PREFIX/share/astral-tree-5.7.8-0/astral.5.7.8.jar -i {input.tree} -o {output.tree}) &> {log}
        #astral --input {input.tree} --output {output.tree}
        """
