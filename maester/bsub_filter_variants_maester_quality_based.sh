#BSUB -W 24:00
#BSUB -n 1
#BSUB -e /home/levinej4/bsub_logs/maester_quality_filter_%I_%J.err
#BSUB -o /home/levinej4/bsub_logs/maester_quality_filter_%I_%J.out
#BSUB -R "rusage[mem=128] span[hosts=1]"
#BSUB -q cpuqueue
#BSUB -sla lsSC
#BSUB -J "maeFQ[1-2]"

j=$LSB_JOBINDEX
i=$(cat /data/lareauc/levinej/mito_working_directory/smack_notebooks/maester/maester_IDs.txt | awk -v ln=$j "NR==ln")


wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/maester/maester_${i}_quality_based"
hdir="${wd}/h5_files"
smack -wd $wd --debug filter-variants $hdir MAESTER --umi-mode UMI