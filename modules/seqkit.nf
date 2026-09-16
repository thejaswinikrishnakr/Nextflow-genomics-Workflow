process SEQKIT_STATS {
    conda 'bioconda::seqkit'
    publishDir "results/stats", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "${sample_id}_stats.txt"

    script:
    """
    seqkit stats ${reads} > ${sample_id}_stats.txt
    """
}
