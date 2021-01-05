%clear all
%close all
%clc

%Path=xlsread('C:\Toan\New_PJT\Matlab\Trajectory_basic\Input_Position',1);

%PXx = Path(:,1);
%PYy = Path(:,2);
%PZz = Path(:,3);
PXx = x_1;
PYy = y_1;
PZz = z_1;

n = length(PZz);
m = 0;

for j = 1:n-1
    POS=PS_New1(PXx(j),PYy(j),PZz(j),PXx(j+1),PYy(j+1),PZz(j+1));
    PX(1,m+1:m+length(POS(1,:))) = POS(1,:);
    PY(1,m+1:m+length(POS(1,:))) = POS(2,:);
    PZ(1,m+1:m+length(POS(1,:))) = POS(3,:);
    m = length(PZ);
    
    for i= 1:m

        [A1(i) A2(i) A3(i) A4(i) A5(i) A6(i) A7(i) A8(i)]=kinematicsPF(PX(1,i),PY(1,i),PZ(1,i));
        T(i) = i;
    end

end


csvwrite('ori_A1.dat',A1)
csvwrite('ori_A2.dat',A2)
csvwrite('ori_A3.dat',A3)
csvwrite('ori_A4.dat',A4)
csvwrite('ori_A5.dat',A5)
csvwrite('ori_A6.dat',A6)
csvwrite('ori_A7.dat',A7)
csvwrite('ori_A8.dat',A8)

%xlswrite('Ori_Output_Motor_Angle.xlsx',A,'Sheet 1','A1')

figure(1) 
plot(PX,'linewidth',1.5)
hold on
plot(PY,'linewidth',1.5)
plot(PZ,'linewidth',1.5)
xlabel('steps')
ylabel('distance(deg)')
set(gca,'fontsize',24,'fontweight','b')
figure(2)
plot3(PX,PY,PZ)
% xlim([-200 200])
% ylim([-200 200])
% zlim([300 700])
