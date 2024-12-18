#BSUB -W 48:00
#BSUB -n 16
#BSUB -e /home/levinej4/bsub_logs/maester_%I_%J.err
#BSUB -o /home/levinej4/bsub_logs/maester_%I_%J.out
#BSUB -R "rusage[mem=64] span[hosts=1]"
#BSUB -q cpuqueue
#BSUB -sla lsSC
#BSUB -J "QmaeG[1-2]"

j=$LSB_JOBINDEX
i=$(cat /data/lareauc/levinej/mito_working_directory/smack_notebooks/maester/maester_IDs.txt | awk -v ln=$j "NR==ln")


wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/maester/maester_${i}_quality_based"
hdir="${wd}/h5_files"
BAM="/data/lareauc/projects/mitochondria/data_download_process/miller2022_maester/aligned/${i}.chrM.cellumi.bam"
BC="/data/lareauc/projects/mitochondria/data_download_process/miller2022_maester/${i}_whitelist_no1.txt"
smack -wd $wd --debug genotype $BAM $hdir -bf $BC --genome hg38 --barcode-tag CR --umi-barcode-tag UR --umi-mode UMI -s MEAN_QUALITY