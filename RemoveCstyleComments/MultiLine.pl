# remove everything that is inside /*...*/ except "*/" (when they are together).
s/\/\*(?:(?!\*\/).)*\*\///g