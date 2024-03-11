rule concatenate_alignments:
    output:
        "results/concatenate_alignments/output.fasta",
        "results/concatenate_alignments/output.txt"
    log:
        "logs/concatentate_alignments/log.txt"
    shell:
        """
        python workflow/scripts/concatenate_alignments.py \
            --input {input_dir} \
            --type DNA \
            --output results/concatenate_alignments/ \
            --prefix output \
            --overwrite
        """
