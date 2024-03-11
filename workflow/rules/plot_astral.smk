rule plot_astral:
    input:
        tree = "results/astral/output.tree.rooted.newick"
    output:
        png = "results/astral_plot/astral_plot.png"
    log:
        "logs/astral_plot/log.txt"
    conda:
        "../envs/r_env.yaml"
    shell:
        """
        Rscript workflow/scripts/plot_tree.R {input.tree} {output.png} {plot_height} {plot_width} &> {log}
        """
