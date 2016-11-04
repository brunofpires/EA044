set NAD;   # origins
set PROVA;   # destinations

param supply {NAD} >= 0;   # qty nadadores
param demand {PROVA} >= 0;   # qty provas

param cost {NAD,PROVA} >= 0;   # indices nas provas
var disp {NAD,PROVA} integer >= 0;    # provas a ser disputada (1) ou nao disputada (0)

minimize Total_Cost:
   sum {i in NAD, j in PROVA} cost[i,j] * disp[i,j];

subject to Supply {i in NAD}:
   sum {j in PROVA} disp[i,j] <= supply[i];

subject to Demand {j in PROVA}:
   sum {i in NAD} disp[i,j] = demand[j];

subject to Lim {j in PROVA, i in NAD}:
	disp[i,j] <= 1;