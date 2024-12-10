#BSUB -W 24:00
#BSUB -n 1
#BSUB -e /home/levinej4/tmp/bsub_logs/crcF_%I_%J.err
#BSUB -o /home/levinej4/tmp/bsub_logs/crcF_%I_%J.out
#BSUB -R rusage[mem=128]
#BSUB -q cpuqueue
#BSUB -J "[1-1]"

wd="/data/lareauc/levinej/mito_working_directory/smack_notebooks/crc"
hdir="${wd}/h5_files"

smack -wd $wd --debug filter-variants $hdir mtscATAC