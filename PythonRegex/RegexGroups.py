import re

# find all occurances that match the pattern
with open('test','r') as f:
    for line in f.readlines():
        _ = re.findall('\((.*)\)',line)
        if len(_)>0:
            print(_)
print("----------------")
# you can also do this. Notice that this matches only the things between "()" only it this is the only thing in the line 
regex=re.compile('^\((.*)\)$')
with open('test','r') as f:
    for line in f.readlines():
        _ = regex.findall(line) #the same as re.findall(regex,line)
        if len(_)>0:
          print(_)
print("----------------")

# named groups as dictionaries
regex=re.compile(r'\((?P<k>.*)\)')
with open('test','r') as f:
    for line in f.readlines():
        _ = regex.finditer(line)
        for m in _  :
            print(m.groupdict())
print("----------------")

# named groups as dictionaries
regex=re.compile('\((?P<group>.*)\)(?P=group)')
with open('test','r') as f:
    for line in f.readlines():
        _ = regex.finditer(line)
        for m in _  :
            print(m.groupdict())
print("----------------")


