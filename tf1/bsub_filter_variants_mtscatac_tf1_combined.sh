#BSUB -W 6:00
#BSUB -n 1
#BSUB -e /home/levinej4/tmp/bsub_logs/mtscatac/tf1_filter_combined_%I_%J.err
#BSUB -o /home/levinej4/tmp/bsub_logs/mtscatac/tf1_filter_combined_%I_%J.out
#BSUB -R rusage[mem=128]
#BSUB -q cpuqueue
#BSUB -J "comTF1[1-1]"

id_file="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/mtscatac_tf1_IDs.txt"
csv_string=$(paste -sd, $id_file)

prefix="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_mtscatac_"
suffix="/h5_files"
# from chatGPT 
hdir=$(echo "$csv_string" | awk -v prefix="$prefix" -v suffix="$suffix" 'BEGIN{FS=OFS=","} {for(i=1; i<=NF; i++) $i=prefix $i suffix; print}')

wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/tf1/tf1_combined_mtscatac_all"

smack -wd $wd --debug filter-variants $hdir mtscATAC