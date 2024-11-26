#BSUB -W 48:00
#BSUB -n 8
#BSUB -e /home/levinej4/tmp/bsub_logs/crc_%I_%J.err
#BSUB -o /home/levinej4/tmp/bsub_logs/crc_%I_%J.out
#BSUB -R "rusage[mem=64] span[hosts=1]"
#BSUB -q cpuqueue
#BSUB -sla lsSC
#BSUB -J "[1-1]"



wd="/lila/data/lareauc/levinej/mito_working_directory/crc"
hdir="${wd}/h5_files"
BAM="/data/lareauc/projects/mitochondria/mtscatac_split_bams_for_jon/CRC_data/crc_for_jon/crc_mtscatac.chrM.bam"
BC="/data/lareauc/projects/mitochondria/mtscatac_split_bams_for_jon/CRC_data/crc_for_jon/barcodes.tsv"

smack -wd $wd --debug genotype $BAM $hdir -bf $BC --genome rCRS --barcode-tag CB