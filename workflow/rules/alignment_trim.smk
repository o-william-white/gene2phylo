rule alignment_trim:
    input:
        "results/mafft_filtered/{genes}.fasta"
    params:
        tmp = "results/alignment_trim/{genes}_tmp.fasta"
    output:
        out = "results/alignment_trim/{genes}.fasta"
    log:
        "logs/alignment_trim/{genes}.log"
    conda:
        "../envs/alignment_trim.yaml"
    shell:
        """
        if [ $(grep -c "^>" {input}) -lt "5" ]; then
            cp {input} {output.out}
        else
            # if [ $(grep -c "^>" {input[0]}) -lt "0" ]; then
            if [[ {alignment_trim} == "gblocks" ]]; then
                 # gblocks add reuslts to same dir as input
                 cp {input} {params.tmp}
                 # gblocks always gives error code of 1. Ignore.
                 Gblocks {params.tmp} -t=d -b4=5 -b5=h &> {log} || true
                 # sed to remove gaps
                 sed 's/ //g' {params.tmp}-gb > {output.out}
                 # rm tmp
                 rm {params.tmp}
                 rm {params.tmp}-gb
             else
                 if [[ {alignment_trim} == "clipkit" ]]; then
                     clipkit {input} -o {output.out} &> {log}
                 fi
             fi
         fi
         """

