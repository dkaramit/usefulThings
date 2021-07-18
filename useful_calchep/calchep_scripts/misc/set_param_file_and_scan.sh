#this script creates a file with the parameters deferent than the declared ones, and then scans for momenta.


param_file=$1
cpus=$2
momenta_file=$3 

./n_calchep -blind   "[[{{$param_file{}}"


./parallel_scan.sh "./run_CH.sh" $cpus $momenta_file