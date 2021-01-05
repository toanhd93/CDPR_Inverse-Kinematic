%clear all
%close all
%clc

%Path=xlsread('C:\Toan\New_PJT\Matlab\Trajectory_basic\Input_Position',1);


%PX = Path(:,1);
%PY = Path(:,2);
%PZ = Path(:,3);
PX = x_1;
PY = y_1;
PZ = z_1;

m = length(PZ);

%t =0.001* Path(:,4);

for i= 1:m
    
    [A1(i) A2(i) A3(i) A4(i) A5(i) A6(i) A7(i) A8(i)]=kinematicsPF(PX(i),PY(i),PZ(i));
    A = [A1; A2; A3; A4; A5; A6; A7; A8];
end


csvwrite('New_A1.dat',A1)
csvwrite('New_A2.dat',A2)
csvwrite('New_A3.dat',A3)
csvwrite('New_A4.dat',A4)
csvwrite('New_A5.dat',A5)
csvwrite('New_A6.dat',A6)
csvwrite('New_A7.dat',A7)
csvwrite('New_A8.dat',A8)

xlswrite('New_Output_Motor_Angle.xlsx',A,'Sheet 1','A1')

grid on
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
xlabel('x')
ylabel('y')
zlabel('z')
set(gcf,'color','w');
%xlim([-200 200])
%ylim([-200 200])
%zlim([300 700])
