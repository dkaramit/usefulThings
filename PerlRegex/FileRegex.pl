#This is how you use perl script to read file in loops and do regex stuff. By the way, you learn a few things about the perl syntax.

#Example (test is a file that has a few lines of text that can help you understand what is going on):
#perl FileRegex.pl test

# the dollar sign "$" denotes variables, while @ an array. ARGV is a list of arguments passed to the script.
# In contrast to  other languages @ARGV[0] is the first argument instead of the name of the script. 
$filename = @ARGV[0]; 

open(FH, '<', $filename); #this opens a fine in read ("<") mode. FH is the "file handler" (basicaly it is like a C++ ifstream instance). 

# if <FH> is in the argument for "while", each line (by default) is the variable $_.
# Now, if you don't use any variable, perl by default looks at $_.
# Therefore, if you write 
# if (/2200/), perl understands that the regex /2200/ needs to be compared to $_.
# Similarly,  "print $_;" is exactly the same as just "print;" !



# this reads the file line-by-line, performs the substitution 1->2200, and prints only the lines that match 2200
# this is equivalent to:
# sed  -n 's/1/2200/g; /2200/p' $filename
# perl -ne 's/1/2200/g; print if /2200/' $filename
print "----substitute 1 to 2200----\n";
while (<FH>){  
    s/1/2200/g;
    if (/2200/){print $_};
}
#once the loop exits, the file reaches EOF. In order to read again you need to open it
close(FH);
print "\n";

print "----captured group between ()----\n";
open(FH, '<', $filename); 
while (<FH>){  
    s/^\s+$//g;#remove empty lines to make it more readable
    # the extra {} define a scope, so that $1 is erased if the regex does not match anything.
    { 
        /\((.*)\)/;
        print $1,"\n" if $1; #if $1 is empty, $1 is interpreted as false
    }
}
close(FH);
print "\n";

print "----captured group between ()----\n";
#this captures and prints only whatever is insinde (), stores it in $1, and prints it.
# Notice that you can assing a variable to a string, and use this as regex 
open(FH, '<', $filename); 
$match='\((.*)\)';
while (<FH>){  
    if (/$match/){print $1,"\n" ;}
}
close(FH);
print "\n";

# capture everything between () that is folloed by whatever is between (). and print he match
#For example, it will mathc (55)55, but not (55) alone. Then it wil print 50.
print "----captured named group ()----\n";
open(FH, '<', $filename); 
$match='\((?<V>.*)\)\k<V>';
while (<FH>){  
    # if (/\((.*)\)$1/){print $1,"\n";} #you can do it using unnamed captured groups
    if (/$match/){print $+{V},"\n";}#the  $+{V} is the captured group here
}
close(FH);
print "\n";


#You can also use captured groups in order to substitute matches.
# this works as in the above example, but subtitutes (50)50 to just 50
print "----substitute captured named group ()----\n";
open(FH, '<', $filename); 
$sub='\((?<gg>.*)\)\k<gg>';
while (<FH>){  
    s/$sub/$+{gg}/g; 
    s/^\s+$//g;#remove empty lines to make it more readable
    print $_;
}
close(FH);
print "\n";


#this is a basic example, but is needed in many things!
print "----the \\R character removes all empty lines including and \\n!----\n";
open(FH, '<', $filename); 
while(<FH>){
    s/\R//g;#removes all \n and empty lines
    s/\s+//g;#removes all remaining spaces
    print $_;
}
close(FH);
print "\n";

