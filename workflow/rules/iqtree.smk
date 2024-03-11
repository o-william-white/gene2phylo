rule iqtree:
    input:
        fasta = input_dir+"/{genes}.fasta"
    output:
        tree = "results/iqtree/{genes}.treefile"
    log:
        "logs/iqtree/{genes}.log"
    conda:
        "../envs/iqtree.yaml"
    shell:
        """
        iqtree -s {input.fasta} -B 1000 --prefix results/iqtree/{wildcards.genes} &> {log}
        """
