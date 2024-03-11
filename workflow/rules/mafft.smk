rule mafft:
    input:
        input_dir+"/{genes}.fasta",
    output:
        "results/mafft/{genes}.fasta",
    log:
        "logs/mafft/{genes}.log",
    conda:
        "../envs/mafft.yaml"
    shell:
        """
        mafft \
            --maxiterate 1000 \
            --globalpair \
            --adjustdirectionaccurately \
            {input} 1> {output} 2> {log}
        """
