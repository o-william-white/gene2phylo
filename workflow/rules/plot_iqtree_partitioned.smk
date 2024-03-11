rule plot_iqtree_partitioned:
    input:
        tree="results/iqtree_partitioned/output.treefile.rooted.newick",
    params:
        height=plot_height,
        width=plot_width,
    output:
        png="results/iqtree_partitioned_plot/iqtree_partitioned_plot.png",
    log:
        "logs/iqtree_partitioned_plot/log.txt",
    conda:
        "../envs/r_env.yaml"
    shell:
        """
        Rscript workflow/scripts/plot_tree.R {input.tree} {output.png} {params.plot_height} {params.plot_width} &> {log}
        """
