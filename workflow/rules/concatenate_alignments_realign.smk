rule concatenate_alignments_realign:
    output:
        "results/concatenate_alignments/output.fasta",
        "results/concatenate_alignments/output.txt"
    log:
        "logs/concatentate_alignments/log.txt"
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        python workflow/scripts/concatenate_alignments.py \
            --input results/alignment_trim/ \
            --type DNA \
            --output results/concatenate_alignments/ \
            --prefix output \
            --overwrite
        """
