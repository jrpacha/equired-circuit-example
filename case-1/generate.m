clc;clear
close all

imax=1;
pref=0.7;
qref=0.2;

uth=1;
zth=0.01+j*0.1;

options=optimset;
options = optimset(options,'TolX',1e-10);
options = optimset(options,'TolFun',1e-10);
options = optimset(options,'MaxFunEvals',Inf);
options = optimset(options,'MaxIter',10000);
options = optimset(options,'Display','on');
options = optimset(options,'Algorithm','levenberg-marquardt');

%initial value
x0=[1,0,0,0,0,0];



for k=1:1:100
%fault impedance
zsc=j*0.2*(1-(k-1)/100); 

%solve
[x,fval,exitflag]=fsolve(@(x)funFSS(x,uth,zth,pref,qref,zsc), x0,options);

flag(k)=exitflag;

end
