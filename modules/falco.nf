process FALCO {
    conda 'bioconda::fastqc'
    publishDir "results/qc", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*.html"
    path "*.zip"

    script:
    """
    fastqc ${reads[0]} ${reads[1]}
    """
}
