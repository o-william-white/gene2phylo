rule iqtree_partitioned:
    input:
        fasta = "results/concatenate_alignments/output.fasta",
        partitions = "results/concatenate_alignments/output.txt"
    output:
        "results/iqtree_partitioned/output.treefile"
    log:
        "logs/iqtree_partitioned/log.txt"
    conda:
        "../envs/iqtree.yaml"
    shell:
        """
        iqtree \
            -s {input.fasta} \
            -p {input.partitions} \
            -B 1000 \
            --prefix results/iqtree_partitioned/output &> {log}
        """
