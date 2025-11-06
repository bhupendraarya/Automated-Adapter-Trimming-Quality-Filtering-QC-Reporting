# Automated-Adapter-Trimming-Quality-Filtering-QC-Reporting
A Bash pipeline for adapter removal, quality filtering (Q20), and comprehensive QC reporting of paired-end sequencing reads. Supports RNA-seq, WGS, and metagenomics workflows.

#NGS Read Preprocessing Pipeline
#Automated trimming and quality control of paired-end FASTQ sequencing data using Cutadapt, FastQC, and MultiQC.
What this does
•	Removes adapters & low-quality bases (Q < 20)
•	Filters short reads (min length: 50 bp)
•	Generates individual and combined QC reports
•	Automatically detects paired reads (_R1 / _R2)
Suitable for
RNA-seq | WGS | Exome | Metagenomics | Amplicon sequencing
(Before alignment, quantification, variant calling, or assembly)
 Tools Required
cutadapt
fastqc
multiqc
Install (recommended):
conda install -c bioconda cutadapt fastqc multiqc
 How to Run
chmod +x trim_fastq.sh
./trim_fastq.sh
Outputs:
trimmed_reads/       # Trimmed FASTQ
fastqc_reports/      # QC HTML reports
multiqc_report/      # Summary report
 Input format
sample1_R1.fastq.gz
sample1_R2.fastq.gz
Contributions welcome!


