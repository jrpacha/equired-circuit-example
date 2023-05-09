clc
clearvars
close all

Sbase=25e6; %25MVA
w=100*pi; %frequency=50hz

%MV Base Value
Ubase1=20e3;
Ibase1=Sbase/Ubase1/sqrt(3); %Line current
Zbase1=Ubase1/Ibase1/sqrt(3); %Each phase

%HV Base Value
Ubase2=110e3;
Ibase2=Sbase/Ubase2/sqrt(3); %Line current
Zbase2=Ubase2/Ibase2/sqrt(3); %Each phase

%Transformer
ztr=(0.016+1.92j)/Zbase1;

y0_1=1/ztr;
y0_12=1/ztr;

uth=1;
zth=0.1*(sqrt(1/101)+j*sqrt(100/101));

%Line
zcable=(0.501+0.716j)/Zbase1;
zcable=(0.501+0.716j)/Zbase1/5;
%zcable=(0.510+j*0.366)/Zbase1;

y1_2=1/(zcable*2.8);
y2_3=1/(zcable*4.4);
y3_4=1/(zcable*0.6);
y3_8=1/(zcable*1.3);
y4_5=1/(zcable*0.6);
y4_11=1/(zcable*0.5);
y5_6=1/(zcable*1.5);
y6_7=1/(zcable*0.2);
y7_8=1/(zcable*1.7);
y8_9=1/(zcable*0.3);
y8_14=1/(zcable*2);
y9_10=1/(zcable*0.8);
y10_11=1/(zcable*0.3);
y12_13=1/(zcable*4.9);
y13_14=1/(zcable*3);

%Load
sload3=(285*(0.97+0.03j)+265*(0.85+0.15j))/Sbase*1000;
sload4=(445*(0.97+0.03j))/Sbase*1000;
sload5=(750*(0.97+0.03j))/Sbase*1000;
sload2=(565*(0.97+0.03j))/Sbase*1000;
sload7=(90*(0.85+0.15j))/Sbase*1000;
sload8=(605*(0.97+0.03j))/Sbase*1000;
sload9=(675*(0.85+0.15j))/Sbase*1000;
sload10=(490*(0.97+0.03j)+80*(0.85+0.15j))/Sbase*1000;
sload11=(340*(0.97+0.03j))/Sbase*1000;
sload13=(40*(0.85+0.15j))/Sbase*1000;
sload14=(215*(0.97+0.03j)+390*(0.85+0.15j))/Sbase*1000;

%VSC1 grid-forming
uref=1;
theta_u=0;%not used
theta_i=-40/180*pi;%not used
ivscmax1=2.5;


%VSC2 bus6 
pdisp2=(-15300*0.98-5100*0.95)/Sbase*1000;
qdisp2=(-15300*0.02-5100*0.05)/Sbase*1000;
ivscmax2=1;

%VSC3 bus12
pdisp3=(-15300*0.98-5280*0.95)/Sbase*1000;
qdisp3=(-15300*0.02-5280*0.05)/Sbase*1000;
ivscmax3=1;

%VSC limitation
uvscmax=1.35;

kisp=2;
ucon=1; %voltage reference for voltage-droop controlled reactive power

zvsc=j*0.1;

zsc=j*1;

y1=1;
y6=1; %not used
y12=1;

id0_vsc2=0;
id0_vsc3=0;

w0=1; %nominal angular frequency
k_w=0.1;%Grid-forming frequency droop gain
k_pw=0.01;%frequency droop of main grid
p0_gf=1;
q0_gf=0;

k_q=0.01;

Yg=[y1_2, y2_3, y3_4, y3_8, y4_5, y4_11, y5_6, y6_7, y7_8,y8_9, y8_14, y9_10, y10_11, y12_13, y13_14, y1, y6, y12, y0_1, y0_12];

pavsc=[uref, theta_u, theta_i, ivscmax1, pdisp2, qdisp2, ivscmax2, pdisp3, qdisp3, ivscmax3, kisp, ucon, id0_vsc2, id0_vsc3,p0_gf,q0_gf];

sload=[sload2, sload3, sload4, sload5, sload7, sload8, sload9, sload10, sload11, sload13, sload14];

% x0=[1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,...%Node Voltage
%     0,0,-0.8,0,-0.8,0,...%ivsc
%     0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,...%iload
%     0,0,...%ith
%     0,0,-0.8,0,-0.8,0, ... % pqvsc
%     1,0,1,0,0];%uth & w & pqgrid

%x0=[0.364977310100052,0.515567800135096,0.401019200241805,0.533091353048614,0.367281768735835,0.468918401055873,0.313802463202241,0.369783243443696,0.312097463774165,0.364370769403176,0.313621816805877,0.363023810184831,0.317218781757777,0.360627505081238,0.315575692199164,0.359791214291313,0.301601531745046,0.352803052414026,0.303274755325227,0.354468741032373,0.307702727520500,0.359345808694835,0.309363217093727,0.361174709068258,0.0701537050279657,0.138045094923081,0.184813016044496,0.243637181112218,0.254992436978074,0.308432009909348,2.50000000000000,4.17233647979696e-23,0.750851271019280,-0.660471323229655,0.891486122969484,-0.453048002481898,0.0235905885661610,0.0282727375936807,0.0298106389005769,0.0289719674250130,0.0242569724349092,0.0266087766592961,0.0410746231425360,0.0446750367618140,0.00506444438895948,0.00406286868129685,0.0340519470282437,0.0374256416633418,0.0385792327009220,0.0317373334789074,0.0315927127135449,0.0334241720305427,0.0186974443457348,0.0205100143497938,0.00331303927075995,0.00306893724793429,0.0393980390300705,0.0374662734226626,3.01775432197417,-2.13136633840299,1.00254800060451,1.33272838262153,3.24754487507446e-23,0.480291529095618,5.71528602599465e-23,0.154848282397556,0.607083965180131,0.794637690536492,0.999745199939549,0.00254800060451228,2.33375731015652];

%for k=1:1:100

%zsc=j*0.2*(1-(k-1)/100); %fault impedance

%zsc=j*0.02;
zsc=0.02j;
y12=1/zsc;

%Initial approximation (?)
x0=[1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,...%Node Voltage
    0,0,-0.8,0,-0.8,0,...%ivsc
    0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,0.02,0,...%iload
    0,0,...%ith
    0,0,-0.8,0,-0.8,0, ... % pqvsc
    1,0,1,0,0,imag(y12)]'; %uth & w & pqgrid

numVars = size(x0,1);
x = zeros(numVars,1);

Yg=[
    y1_2,...       %Yg(1)
    y2_3,...       %Yg(2)
    y3_4,...       %Yg(3)
    y3_8,...       %Yg(4)
    y4_5,...       %Yg(5)
    y4_11,...      %Yg(6)
    y5_6,...       %Yg(7)
    y6_7,...       %Yg(8)
    y7_8,...       %Yg(9) 
    y8_9,...       %Yg(10)
    y8_14,...      %Yg(11)
    y9_10,...      %Yg(12)
    y10_11,...     %Yg(13)
    y12_13,...     %Yg(14)
    y13_14,...     %Yg(15)
    y1,...         %Yg(16)
    y6,...         %Yg(17)
    y12,...        %Yg(18)
    y0_1,...       %Yg(19)
    y0_12...       %Yg(20)
    ];

pavsc=[
    uref,...       %pavsc(1)
    theta_u,...    %pavsc(2)
    theta_i,...    %pavsc(3)   
    ivscmax1,...   %pavsc(4)
    pdisp2,...     %pavsc(5) 
    qdisp2,...     %pavsc(6) 
    ivscmax2,...   %pavsc(7) 
    pdisp3,...     %pavsc(8) 
    qdisp3,...     %pavsc(9) 
    ivscmax3,...   %pavsc(10)
    kisp,...       %pavsc(11) 
    ucon,...       %pavsc(12) 
    id0_vsc2,...   %pavsc(13) 
    id0_vsc3,...   %pavsc(14)
    p0_gf,...      %pavsc(15)
    q0_gf,...      %pavsc(16)
    ];

%i2=18;

ff = @(x) funFFF(x, Yg, pavsc, sload, uth, zth, k_w, k_pw, w0, k_q);
dff = @(x) dfunFFF(x,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q);

%Refine initial approach:
%refine the initial approximation x0.
G = @(x)[ff(x);x(end)-x0(end)];

v1 = zeros(1, numVars);
v1(end) = 1;
dG = @(x)[dff(x); v1];

tol=1.0e-13;
itmax=10;
[XK,DFk,res,it] = nnewton(x0,tol,itmax,G,dG);
x0 = XK(:,end);

sgn = -1.0;
s0 = 0.0;
ds = 0.5 ;
smax = 500;
%[X,S] = cont(x0,s0,ds,smax,sgn,tol,itmax,ff,dff);
[X,S,DS,R] = contSSC(x0,s0,ds,smax,sgn,tol,itmax,ff,dff);
plot(S,X(end,:),'.r','linewidth',1.5)
xlabel('$s$','FontSize',12,'Interpreter','latex')
ylabel('$\mathrm{Im}(y_{12}) = -1/|Z_{SC}|$','FontSize',12,'Interpreter','latex')
hold on
sgn = 1.0;
s0 = 0.0;
ds = 0.5 ;
smax = 500;
%[X,S] = cont(x0,s0,ds,smax,sgn,tol,itmax,ff,dff);
[X,S,DS,R] = contSSC(x0,s0,ds,smax,sgn,tol,itmax,ff,dff);
plot(S,X(end,:),'o','MarkerFaceColor','blue','MarkerSize',2)
hold off