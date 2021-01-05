function [L1 L2 L3 L4 L5 L6 L7 L8]=kinematicsIN(x,y,z)



P1=[-437.082 524.3283 864.7443];  
P2=[439.7277 525.9461 860.8701];       %%           
P3=[-435.143 -521.906 839.1691];        %%
P4=[437.8987 -523.83 859.4645];         %%
P5=[-535.048 466.8895 79.72492];        %%
P6=[531.9962 451.4305 80.32775];         %%
P7=[-543.043 -463.811 71.49693];         %%
P8=[529.0567 -448.63 84.36402];        %%
% 
% P1=[-455, 540, 903];  
% P2=[455, 540, 902];       %%           
% P3=[-455, -540, 877];        %%
% P4=[455, -540, 901];         %%
% P5=[-540, 465, 73.5];        %%
% P6=[540, 455, 73];         %%
% P7=[-540, -455, 73];         %%
% P8=[540, -455, 72];        %%



e1=[-130/2,130/2,-130/2];
e2=[130/2,130/2,-130/2];
e3=[-130/2,-130/2,-130/2];
e4=[130/2,-130/2,-130/2];
e5=[-130/2,130/2,130/2];
e6=[130/2,130/2,130/2];
e7=[-130/2,-130/2,130/2];
e8=[130/2,-130/2,130/2];
G=[x y z];




L1ve=P1-e1-G; %% center point of pulley
L2ve=P2-e2-G;
L3ve=P3-e3-G;
L4ve=P4-e4-G;
L5ve=P5-e5-G;
L6ve=P6-e6-G;
L7ve=P7-e7-G;
L8ve=P8-e8-G;
%%%%%%%%%%%%%%%%%%%
bxy1p=sqrt((L1ve(1)^2)+(L1ve(2)^2));
bxy2p=sqrt((L2ve(1)^2)+(L2ve(2)^2));
bxy3p=sqrt((L3ve(1)^2)+(L3ve(2)^2));
bxy4p=sqrt((L4ve(1)^2)+(L4ve(2)^2));
bxy5p=sqrt((L5ve(1)^2)+(L5ve(2)^2));
bxy6p=sqrt((L6ve(1)^2)+(L6ve(2)^2));
bxy7p=sqrt((L7ve(1)^2)+(L7ve(2)^2));
bxy8p=sqrt((L8ve(1)^2)+(L8ve(2)^2));
VL=[13,13,13,13,13,13,13,13];
%%%%%%%%%%%%%%%%%%%%%%%%%%
bxy1=bxy1p-VL(1);
bxy2=bxy2p-VL(2);
bxy3=bxy3p-VL(3);
bxy4=bxy4p-VL(4);
bxy5=bxy5p-VL(5);
bxy6=bxy6p-VL(6);
bxy7=bxy7p-VL(7);
bxy8=bxy8p-VL(8);
%%%%%%%%%%%%%%%%%%%%%%%
bz1=L1ve(3);
bz2=L2ve(3);
bz3=L3ve(3);
bz4=L4ve(3);
bz5=L5ve(3);
bz6=L6ve(3);
bz7=L7ve(3);
bz8=L8ve(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MB1=sqrt((bxy1^2)+(bz1^2));
MB2=sqrt((bxy2^2)+(bz2^2));
MB3=sqrt((bxy3^2)+(bz3^2));
MB4=sqrt((bxy4^2)+(bz4^2));
MB5=sqrt((bxy5^2)+(bz5^2));
MB6=sqrt((bxy6^2)+(bz6^2));
MB7=sqrt((bxy7^2)+(bz7^2));
MB8=sqrt((bxy8^2)+(bz8^2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rp=[13 13 13 13 13 13 13 13];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lf(1)=sqrt((MB1^2)-(rp(1)^2));
lf(2)=sqrt((MB2^2)-(rp(2)^2));
lf(3)=sqrt((MB3^2)-(rp(3)^2));
lf(4)=sqrt((MB4^2)-(rp(4)^2));
lf(5)=sqrt((MB5^2)-(rp(5)^2));
lf(6)=sqrt((MB6^2)-(rp(6)^2));
lf(7)=sqrt((MB7^2)-(rp(7)^2));
lf(8)=sqrt((MB8^2)-(rp(8)^2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta(1)=acos(lf(1)/sqrt((bxy1^2)+(bz1^2)))+acos(bz1/(sqrt((bxy1^2)+bz1^2)));
beta(2)=acos(lf(2)/sqrt((bxy2^2)+(bz2^2)))+acos(bz2/(sqrt((bxy2^2)+bz2^2)));
beta(3)=acos(lf(3)/sqrt((bxy3^2)+(bz3^2)))+acos(bz3/(sqrt((bxy3^2)+bz3^2)));
beta(4)=acos(lf(4)/sqrt((bxy4^2)+(bz4^2)))+acos(bz4/(sqrt((bxy4^2)+bz4^2)));
beta(5)=acos(lf(5)/sqrt((bxy5^2)+(bz5^2)))+acos(bz5/(sqrt((bxy5^2)+bz5^2)));
beta(6)=acos(lf(6)/sqrt((bxy6^2)+(bz6^2)))+acos(bz6/(sqrt((bxy6^2)+bz6^2)));
beta(7)=acos(lf(7)/sqrt((bxy7^2)+(bz7^2)))+acos(bz7/(sqrt((bxy7^2)+bz7^2)));
beta(8)=acos(lf(8)/sqrt((bxy8^2)+(bz8^2)))+acos(bz8/(sqrt((bxy8^2)+bz8^2)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L1=lf(1)+beta(1)*rp(1);
L2=lf(2)+beta(2)*rp(2);
L3=lf(3)+beta(3)*rp(3);
L4=lf(4)+beta(4)*rp(4);
L5=lf(5)+beta(5)*rp(5);
L6=lf(6)+beta(6)*rp(6);
L7=lf(7)+beta(7)*rp(7);
L8=lf(8)+beta(8)*rp(8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end