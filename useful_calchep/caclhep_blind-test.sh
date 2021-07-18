#this produces prints the process in a file. Then, it produces n_calchep for 2*x process
# ./calchep -blind "[{{\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08h->2*x{{{[[{}}}}}}"
# cat results/list_prc.txt
# ./calchep -blind "[{{\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08h->2*x{{{[{[[[{}}}}}}"
# #this resets caclchep to the start, so you can use the previous one with no problem
# ./calchep -blind "}}}}}}}"
# cd results

# ../bin/name_cycle Mh 1E-2 1E-3 100

#this produces n_calchep for h->AA. Along with this it produces the process library file. (notice that to get this, you need one less enter than the 2*x one)
./calchep -blind "[{{\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\8e\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08h->A,A{{[{[[[{}}}}}}"

#this resets caclchep to the start, so you can use the previous one with no problem
./calchep -blind "}}}}}}}"
cd results

../bin/name_cycle Mh 1E-5 1E-6 100

