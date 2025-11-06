
#!/bin/bash
set -e 

# Set directory paths
input_dir="raw_reads"
trim_dir="trimmed_reads"
fastqc_dir="fastqc_reports"
multiqc_dir="multiqc_report"

#  Create output folders 
mkdir -p "$trim_dir" "$fastqc_dir" "$multiqc_dir"

echo " Starting Adapter Trimming using Cutadapt..."

#  Processing paired-end reads 
for R1 in "$input_dir"/*_R1*.fastq.gz
do
    R2="${R1/_R1/_R2}"  # automatically get matching R2
    base=$(basename "$R1" | sed 's/_R1.*//')

    cutadapt \
      -a AGATCGGAAGAGC \
      -A AGATCGGAAGAGC \
      -q 20 \
      -m 50 \
      -o "$trim_dir/${base}_R1.trimmed.fastq.gz" \
      -p "$trim_dir/${base}_R2.trimmed.fastq.gz" \
      "$R1" "$R2"

    echo " Trimmed: $base"
done

echo " Cutadapt trimming completed"
echo " Running FastQC on trimmed reads..."

#  Run FastQC 
fastqc "$trim_dir"/*.fastq.gz -o "$fastqc_dir" -t 4

echo " FastQC completed"
echo " Running MultiQC..."

#  MultiQC 
multiqc "$fastqc_dir" -o "$multiqc_dir"

echo " MultiQC completed"

echo " Trimmed Reads: $trim_dir"
echo " FastQC Reports: $fastqc_dir"
echo " MultiQC Summary: $multiqc_dir"
