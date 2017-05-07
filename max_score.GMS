SETS   i "team", j "player", k "position" ;
PARAMETERS  c(j) "Score", a(i,j) "Resource Usage", b(i) "Resource per team", d(k,j) "Resource Usage", f(k) "Resource per position"  ;
VARIABLES   z "Maximize score" ;
Binary Variables   x(j) ;
EQUATIONS  overall_score  "Objective Function", con1(i), con2(k) ;
overall_score ..    z  =e=  sum(j,  c(j)*x(j) ) ;
con1(i) ..   sum(j, a(i,j)*x(j)) =l= b(i) ;
con2(k) ..   sum(j, d(k,j)*x(j)) =e= f(k) ;
MODEL max_score /all/ ;
SETS  i /1*21/, j /1*550/, k /1*4/  ;
$CALL GDXXRW.EXE model.xlsx par=c Rng=gam_data!B5:UF6 dim=1
$GDXIN model.gdx
$LOAD c
$GDXIN
$CALL GDXXRW.EXE model.xlsx par=a Rng=gam_data!B10:UF31
$GDXIN model.gdx
$LOAD a
$GDXIN
$CALL GDXXRW.EXE model.xlsx par=d Rng=gam_data!B33:UF37
$GDXIN model.gdx
$LOAD d
$GDXIN
$CALL GDXXRW.EXE model.xlsx par=b Rng=gam_data!C40:W41 dim=1
$GDXIN model.gdx
$LOAD b
$GDXIN
$CALL GDXXRW.EXE model.xlsx par=f Rng=gam_data!C46:F47 dim=1
$GDXIN model.gdx
$LOAD f
$GDXIN
SOLVE max_score USING MIP MAXIMIZING  z ;



