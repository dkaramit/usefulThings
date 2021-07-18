#This script runs a Mathematica sript, and kills it if it take too long to terminate.

############################################################################################################
#To use this script, at the *end* of your Mathematica sript (after all calculations are done),
#put a command that creates a file called "FINISHED.MATH".
############################################################################################################

#MathRUN.sh waits for FINISHED.MATH to be created (this indicates that the calculations are over).
#If this file is created and the sript is not terminated (after some time), MathRUN.sh forcebly
#kills Mathematica (only the pid of the given Mathematica script).


############################################################################################################
#If there is a file from a previous session delete it!
if [  -f "FINISHED.MATH" ]
then
  rm "FINISHED.MATH"
fi


#Example of Mathematica sript:
#Run mathematica script
#MathKernel -script ./tt.m  & #this works on Linux
/Applications/Mathematica.app/Contents/MacOS/MathKernel -script ./tt.m  & #this works on mac
#get the pid of MathKernel
cm=$!

############################
#wait until Mathematica writes the FINISHED.MATH file
#echo $cm
while true
do
  #chech every 0.5 sec if mathematica is done
  sleep 0.5
  #echo -n   "."
  if [  -f "FINISHED.MATH" ]
  then
    echo "Mathematica finished"
    break
  fi
done
################################


#################################################
#check if Mathematica still runs. If it still runs wait 1 second.
#if [ -e /proc/$cm ]#this works on linux
if ps -p $cm > /dev/null #this works on mac
 then
 echo "But it still runs. Waiting 1 sec, and then I'm going to kill it."
 sleep 1s
fi
###########################

######################################################
#If after 1 second Mathematica still runs, kill it!
if ps -p $cm > /dev/null
then
   echo "Force kill Mathematica."
   kill -9 $cm
fi
#################################################

#remove the check file
echo "done!"
rm "FINISHED.MATH"


exit
