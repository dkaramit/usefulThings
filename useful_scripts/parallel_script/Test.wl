(* ::Package:: *)

args=Table[$CommandLine[[i]],{ i, 4 ,Length[$CommandLine]} ]


rnd=RandomChoice[{1,10,50}];


Table[NIntegrate[Exp[x]*Sin[y],{x,0,1},{y,0,1}],{i,500*rnd}];


Do[i//Print,{i,args}]
Print[rnd]
