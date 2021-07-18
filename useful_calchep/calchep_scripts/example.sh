#This is an example on how to use the scripts
#Everything is built for 2->n processes, so be careful.

#First you create a process.
#For example, this will create the process h,h->h,h
./create_processes.sh "h,h->h,h"

#If this is the first process you create, the result will be in prc_0,
#for the second process the result will be in prc_1, and so on.

#find how many processes exist
Ps=`ls | grep "prc_*" 2>/dev/null | wc -l`

#you go to the new directory. You can really automate this process by building an index file with all the process you have created.
cd prc_$((Ps-1))



#make sure you can run the scripts
chmod +x *.sh 


#Once you are in the directory of the process, you can run the scripts.

# run_CH.sh p1:
# Runs n_calchep for momentum p1. The convention here is that p1 is half the cm momentum of the the two incoming particles.


# parallel_scan.sh command cpus input_file :
# Runs "cpus"  simultaneously the command, which takes as input the lines of input_file.
#For example, if you have an input file (input.dat) with 20 lines and you have 8 cores, you can run
#parallel_scan.sh command 8 input.dat 
# and get the results of 

#command line_1
#command line_2
#...
#command line_20

#With 8 simultaneously command executions. 



# set_param_file_and_scan.sh param_file cpus momenta_file :
#Sets the parameters of n_calchep as in  param_file, and then runs 
# parallel_scan.sh ./run_CH cpus momenta_file

###############################
#To run this example, I will create  dummy momenta and parameter files. You should use your own
echo "Mh 50">param #this sets the mass of the Higgs to 50GeV

#creates a momentum file
touch p.dat
for (( c=50 ; $c<=100 ; c=$((c+5)) ))
do
    echo "$c" >> p.dat
done

#run set_param_file_and_scan.sh in four cores using the files just created

./set_param_file_and_scan.sh param 4 p.dat


cd ..
#delete the directory
rm -r prc_$((Ps-1))
