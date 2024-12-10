#BSUB -W 8:00
#BSUB -n 1
#BSUB -e /home/levinej4/tmp/bsub_logs/mtscatac/TF1_filter_sep_%I_%J.err
#BSUB -o /home/levinej4/tmp/bsub_logs/mtscatac/TF1_filter_sep_%I_%J.out
#BSUB -R rusage[mem=72]
#BSUB -q cpuqueue
#BSUB -J "sepTF1[1-2]"

j=$LSB_JOBINDEX
i=$(cat /data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/mtscatac_tf1_IDs.txt | awk -v ln=$j "NR==ln")

# wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_mtscatac_${i}"

old_wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_mtscatac_${i}"
wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_mtscatac_separate_${i}"

hdir="${old_wd}/h5_files"

smack -wd $wd --debug filter-variants $hdir mtscATAC
