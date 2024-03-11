rule concatenate_alignments:
    params:
        input_dir=input_dir,
    output:
        "results/concatenate_alignments/output.fasta",
        "results/concatenate_alignments/output.txt",
    log:
        "logs/concatentate_alignments/log.txt",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        python workflow/scripts/concatenate_alignments.py \
            --input {params.input_dir} \
            --type DNA \
            --output results/concatenate_alignments/ \
            --prefix output \
            --overwrite
        """
