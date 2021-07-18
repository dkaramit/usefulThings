#!/bin/bash

perl -p SingleLine.pl $1 | tr '\n' '\f' | perl -p MultiLine.pl |  perl -pe 's/\f/\n/g' | perl -pe 's/^\s+$//g'

#an intereting usage is the following:
# tail -n +1 $(find -regextype posix-extended -regex '.*.(hpp|cpp)$') | bash RemoveComments.sh | perl -pe 's/==>(.*)<==/\/\*$1\*\//g'
# which removes comments from all .c** and .hpp files in ./, and prints a file, where the only comments are the filenames of the code that follows! 