rule filter_alignments:
    input:
        "results/mafft/{genes}.fasta"
    params:
        threshold = missing_threshold
    output:
        "results/mafft_filtered/{genes}.fasta"
    log:
        "logs/mafft_filtered/{genes}.log"
    shell:
        """
        python workflow/scripts/alignments_filter.py --input {input} --output {output} --threshold {params.threshold} > {log}
        """
