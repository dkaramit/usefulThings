#This script runs n_calchep in a temporary directory. 
#The idea is to run a lot of them in parallel (that is why I switch parallelization to 1, see later)

# It is run with one argument which is the center-of-mass momentum of an incoming particle (p_1^cm).
# It prints p_1^cm csx (in pb) relative_error



#make a directory proc_$BASHPID
Dir="proc_"$$




#make the directory
mkdir $Dir

#copy everything n_calchep needs in $Dir
cp -r aux  $Dir
cp n_calchep $Dir
count_so=`ls -1 *.so 2>/dev/null | wc -l`
if [ $count_so != 0  ]
then
    cp *.so $Dir
fi


#go to $Dir
cd $Dir


#this is the command that runs n_calchep
#it does three things:
#1. swithces the parallelism to 1
#2. sets the momenta to p_1^cm
#3. sets the vegas argumets (nSess_1=5 n_Calls_1=1000 and nSess_2=5 n_Calls_2=10000)
nice -n 19 ./n_calchep -blind "\85[{1{}[{[[{$1{[{$1{}][[[[[[[[[{{5{[{1000{[[{[[{[{]]]]]]{5{[{10000{[[{0"  2>&1 1>  cs.o


#if the result is zero, there is no output file from calchep, so print 0. otherwise print the result
if [ -f "prt_1" ]
then
    res=`grep "< >"  prt_1 |tail -1` || is_zero=1
    res=`echo $res| cut -f3,4 -d" "`
    echo $1 $res 
else
    echo $1 0 0
fi


#remove the directory.
cd .. 
rm -r $Dir
