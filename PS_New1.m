function [POS] = PS_New1(x0,y0,z0,x1,y1,z1)
m=1;     %%% numbering
t=5/1000; %%% cycle time
n=1; %%% number of points many points mean slow speed
v=0; %%% velocity of end-effector
syms k

a=JERKS(x0, 0, 0,x1,v,0,(n*t));
a1=JERKS(y0, 0, 0,y1,v,0,(n*t));
a2=JERKS(z0, 0, 0,z1,v,0,(n*t));

 for i = t:t:(n*t)    
    POS(1,m)= a(1,1)*(i^0)+a(2,1)*(i^1)+a(3,1)*(i^2)+a(4,1)*(i^3)+a(5,1)*(i^4)+a(6,1)*(i^5); % x
    POS(2,m)= a1(1,1)*(i^0)+a1(2,1)*(i^1)+a1(3,1)*(i^2)+a1(4,1)*(i^3)+a1(5,1)*(i^4)+a1(6,1)*(i^5); % y
    POS(3,m)= a2(1,1)*(i^0)+a2(2,1)*(i^1)+a2(3,1)*(i^2)+a2(4,1)*(i^3)+a2(5,1)*(i^4)+a2(6,1)*(i^5); % z
    m = m+1;
 end