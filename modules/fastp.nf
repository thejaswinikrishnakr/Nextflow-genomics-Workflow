process FASTP {
    conda 'bioconda::fastp'
    
    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_trimmed*.fastq.gz"), emit: trimmed_reads

    script:
    """
    fastp -i ${reads[0]} -I ${reads[1]} \
          -o ${sample_id}_trimmed_1.fastq.gz -O ${sample_id}_trimmed_2.fastq.gz
    """
}
