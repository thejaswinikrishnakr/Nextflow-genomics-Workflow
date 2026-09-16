nextflow.enable.dsl=2

// Import the modules you just created
include { FASTP } from './modules/fastp.nf'
include { SEQKIT_STATS } from './modules/seqkit.nf'
include { FALCO } from './modules/falco.nf'

workflow {
    // 1. Define the input channel (points to the test data you downloaded in Step 3)
    read_ch = Channel.fromFilePairs("${projectDir}/data/test_{1,2}.fastq.gz")

    // 2. SEQUENTIAL STEP: Raw reads flow into FASTP for trimming
    FASTP(read_ch)

    // 3. PARALLEL STEPS: The output of FASTP flows into BOTH modules simultaneously
    // Nextflow handles the parallelism automatically because these two don't depend on each other.
    SEQKIT_STATS(FASTP.out.trimmed_reads)
    FALCO(FASTP.out.trimmed_reads)
}
