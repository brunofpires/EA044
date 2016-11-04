#option solver cplex;
set NAD;   # origins
set PROVA;   # destinations

param supply {NAD} >= 0;   # qty nadadores
param demand {PROVA} >= 0;   # qty provas

param cost {NAD,PROVA} >= 0;   # indices nas provas
var disp {NAD,PROVA} integer >= 0;    # provas a ser disputada (1) ou nao disputada (0)
var tempo {i in NAD, j in PROVA} = cost[i,j] * disp[i,j] ;


maximize disputas:
	sum {i in NAD, j in PROVA} disp[i,j] * 1;
	
subject to Supply {i in NAD}:
   sum {j in PROVA} disp[i,j] <= supply[i];

subject to Lim {j in PROVA, i in NAD}:
	disp[i,j] <= 1;

subject to t100b {j in PROVA}:
	sum {i in NAD} tempo[i,"100b"] <= 1;

subject to t100c {j in PROVA}:
	sum {i in NAD} tempo[i,"100c"] <= 1;

subject to t100l {j in PROVA}:
	sum {i in NAD} tempo[i,"100l"] <= 1;

subject to t100p {j in PROVA}:
	sum {i in NAD} tempo[i,"100p"] <= 1;

subject to t1500l {j in PROVA}:
	sum {i in NAD} tempo[i,"1500l"] <= 1;

subject to t200b {j in PROVA}:
	sum {i in NAD} tempo[i,"200b"] <= 1;

subject to t200c {j in PROVA}:
	sum {i in NAD} tempo[i,"200c"] <= 1;

subject to t200l {j in PROVA}:
	sum {i in NAD} tempo[i,"200l"] <= 1;

subject to t200m {j in PROVA}:
	sum {i in NAD} tempo[i,"200m"] <= 1;

subject to t200p {j in PROVA}:
	sum {i in NAD} tempo[i,"200p"] <= 1;

subject to t400l {j in PROVA}:
	sum {i in NAD} tempo[i,"400l"] <= 1;

subject to t400m {j in PROVA}:
	sum {i in NAD} tempo[i,"400m"] <= 1;

subject to t50l {j in PROVA}:
	sum {i in NAD} tempo[i,"50l"] <= 1;

subject to t800l {j in PROVA}:
	sum {i in NAD} tempo[i,"800l"] <= 1;
	
subject to t4x100l {j in PROVA}:
	sum {i in NAD} tempo[i,"4x100l"] <= 4;

subject to tt4x100l {j in PROVA}:
	sum {i in NAD} disp[i,"4x100l"] = 4;
	
subject to t4x200l {j in PROVA}:
	sum {i in NAD} tempo[i,"4x200l"] <= 4;

subject to tt4x200l {j in PROVA}:
	sum {i in NAD} disp[i,"4x200l"] = 4;
