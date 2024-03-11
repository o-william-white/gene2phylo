rule plot_iqtree:
    input:
        tree = "results/iqtree/{genes}.treefile.rooted.newick"
    output:
        png = "results/iqtree_plots/{genes}.png"
    log:
        "logs/iqtree_plots/{genes}.txt"
    conda:
        "../envs/r_env.yaml"
    shell:
        """
        Rscript workflow/scripts/plot_tree.R {input.tree} {output.png} {plot_height} {plot_width} &> {log}
        """
