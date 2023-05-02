function fun=funFSS(x,uth,zth,pref,qref,zsc)

u0x=real(uth);
u0y=imag(uth);

y0_1=1/zth;
y0_1x=real(y0_1);
y0_1y=imag(y0_1);

y1=1/zsc;
y1x=real(y1);
y1y=imag(y1);

u1x=x(1);
u1y=x(2);
ivsc1x=x(3);
ivsc1y=x(4);
pvsc1=x(5);
qvsc1=x(6);

%VSC1
fun(1)=pvsc1;
fun(2)=ivsc1x^2+ivsc1y^2-1;
fun(3)=pvsc1-(u1x*ivsc1x+u1y*ivsc1y); %vsc1 in PQ control
fun(4)=qvsc1-(u1y*ivsc1x-u1x*ivsc1y);
%bus1
fun(5)=ivsc1x+(y0_1x*(u0x-u1x)-y0_1y*(u0y-u1y))-(y1x*u1x-y1y*u1y); 
fun(6)=ivsc1y+(y0_1x*(u0y-u1y)+y0_1y*(u0x-u1x))-(y1x*u1y+y1y*u1x);