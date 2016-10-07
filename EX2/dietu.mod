set MINREQ;   # nutrients with minimum requirements
set MAXREQ;   # nutrients with maximum requirements

set NUTR = MINREQ union MAXREQ;    # nutrients
set FOOD;                          # foods

param cost {FOOD} > 0;
param f_min {FOOD} >= 0;
param f_max {j in FOOD} >= f_min[j];

param n_min {MINREQ} >= 0;
param n_max {MAXREQ} >= 0;

param amt {NUTR,FOOD} >= 0;

var BuyC {j in FOOD} >= f_min[j], <= f_max[j];
var BuyA {j in FOOD} >= f_min[j], <= f_max[j];
var BuyJ {j in FOOD} >= f_min[j], <= f_max[j];
var Buy {j in FOOD} = BuyC[j] + BuyA[j] + BuyJ[j];

minimize Total_Cost:  sum {j in FOOD} cost[j] * Buy[j];

subject to Diet_Min {i in MINREQ}:
   sum {j in FOOD} amt[i,j] * Buy[j] >= n_min[i];
subject to Diet_Max {i in MAXREQ}:
   sum {j in FOOD} amt[i,j] * Buy[j] <= n_max[i];
   
subject to MincalC {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyC[j] >= 300;
subject to MaxcalC {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyC[j] <= 800;

subject to MincaA {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyA[j] >= 400;
subject to MaxcaA {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyA[j] <= 1000;
   
subject to MincalJ {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyJ[j] >= 200;
subject to MaxcalJ {i in MAXREQ}:
   sum {j in FOOD} amt["CALORIAS",j] * BuyJ[j] <= 600;
   
subject to aliC {i in MAXREQ}:
   sum {j in FOOD} BuyC[j] / ( BuyC[j] + 0.1 ) >= 5;
subject to aliA {i in MAXREQ}:
   sum {j in FOOD} BuyA[j] / ( BuyA[j] + 0.1 ) >= 5;
subject to aliJ {i in MAXREQ}:
   sum {j in FOOD} BuyJ[j] / ( BuyJ[j] + 0.1 ) >= 5;