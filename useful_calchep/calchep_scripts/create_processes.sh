#Get the result directory for a process (should be passed as argument) and copy it to a unique directory.


# Count how many processes have been created. The new process will be saved to a new directory with name prc_$((Ps+1)).
Ps=`ls | grep "prc_*" 2>/dev/null | wc -l`


#this is the process. For example "h,h->h,h"
PRC=$1

#create the relevant files in results/
./calchep -blind "{{\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\08\08\08\08\08\08\08\08\08\08\08\08\08$1{{[{[[[{"

#move results/ to the new directory
mv results prc_"$Ps"


#copy the my scripts from misc
for i in `ls misc`
do
    cp "misc/$i" prc_"$Ps"
done

#return calchep to the default state
./calchep -blind "}}}}}}}}}}}}}}}}}}}"

