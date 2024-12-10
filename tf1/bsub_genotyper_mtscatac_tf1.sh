#BSUB -W 12:00
#BSUB -n 12
#BSUB -e /home/levinej4/tmp/bsub_logs/mtscatac_TF1_%I_%J.err
#BSUB -o /home/levinej4/tmp/bsub_logs/mtscatac_TF1_%I_%J.out
#BSUB -R rusage[mem=64]
#BSUB -q cpuqueue
#BSUB -J "TF1-[1-2]"

j=$LSB_JOBINDEX
i=$(cat /data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/mtscatac_tf1_IDs.txt | awk -v ln=$j "NR==ln")

wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_mtscatac_${i}"
hdir="${wd}/h5_files"
BAM="/data/lareauc/projects/mitochondria/data_download_process/lareau2021_mtscatac/${i}_hg38_v20-mtMask/outs/possorted_bam.bam"
BC="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/${i}_cells.txt"
smack -wd $wd --debug genotype $BAM $hdir -bf $BC --genome hg38 --barcode-tag CB --sample-id $i