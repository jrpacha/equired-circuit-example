function fun=funFFF(x,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q)

y1_2x=real(Yg(1));
y1_2y=imag(Yg(1));
y2_3x=real(Yg(2));
y2_3y=imag(Yg(2));
y3_4x=real(Yg(3));
y3_4y=imag(Yg(3));
y3_8x=real(Yg(4));
y3_8y=imag(Yg(4));
y4_5x=real(Yg(5));
y4_5y=imag(Yg(5));
y4_11x=real(Yg(6));
y4_11y=imag(Yg(6));
y5_6x=real(Yg(7));
y5_6y=imag(Yg(7));
y6_7x=real(Yg(8));
y6_7y=imag(Yg(8));
y7_8x=real(Yg(9));
y7_8y=imag(Yg(9));
y8_9x=real(Yg(10));
y8_9y=imag(Yg(10));
y8_14x=real(Yg(11));
y8_14y=imag(Yg(11));
y9_10x=real(Yg(12));
y9_10y=imag(Yg(12));
y10_11x=real(Yg(13));
y10_11y=imag(Yg(13));
y12_13x=real(Yg(14));
y12_13y=imag(Yg(14));
y13_14x=real(Yg(15));
y13_14y=imag(Yg(15));
y1x=real(Yg(16));
y1y=imag(Yg(16));
y6x=real(Yg(17));
y6y=imag(Yg(17));
y12x=real(Yg(18));
y12y=imag(Yg(18));
y0_1x=real(Yg(19));
y0_1y=imag(Yg(19));
y0_12x=real(Yg(20));
y0_12y=imag(Yg(20));

uref=pavsc(1);
theta_u=pavsc(2);
theta_i=pavsc(3);
ivscmax1=pavsc(4);
pdisp2=pavsc(5);
qdisp2=pavsc(6);
ivscmax2=pavsc(7);
pdisp3=pavsc(8);
qdisp3=pavsc(9);
ivscmax3=pavsc(10);
kisp=pavsc(11);
ucon=pavsc(12);
id0_vsc2=pavsc(13);
id0_vsc3=pavsc(14);

p0_gf=pavsc(15);
q0_gf=pavsc(16);

urefx=real(uref);
urefy=imag(uref);

pld2=real(sload(1));
qld2=imag(sload(1));
pld3=real(sload(2));
qld3=imag(sload(2));
pld4=real(sload(3));
qld4=imag(sload(3));
pld5=real(sload(4));
qld5=imag(sload(4));
pld7=real(sload(5));
qld7=imag(sload(5));
pld8=real(sload(6));
qld8=imag(sload(6));
pld9=real(sload(7));
qld9=imag(sload(7));
pld10=real(sload(8));
qld10=imag(sload(8));
pld11=real(sload(9));
qld11=imag(sload(9));
pld13=real(sload(10));
qld13=imag(sload(10));
pld14=real(sload(11));
qld14=imag(sload(11));

zthx=real(zth);
zthy=imag(zth);


u0x=x(1);
u0y=x(2);
u1x=x(3);
u1y=x(4);
u2x=x(5);
u2y=x(6);
u3x=x(7);
u3y=x(8);
u4x=x(9);
u4y=x(10);
u5x=x(11);
u5y=x(12);
u6x=x(13);
u6y=x(14);
u7x=x(15);
u7y=x(16);
u8x=x(17);
u8y=x(18);
u9x=x(19);
u9y=x(20);
u10x=x(21);
u10y=x(22);
u11x=x(23);
u11y=x(24);
u12x=x(25);
u12y=x(26);
u13x=x(27);
u13y=x(28);
u14x=x(29);
u14y=x(30);

ivsc1x=x(31);
ivsc1y=x(32);
ivsc2x=x(33);
ivsc2y=x(34);
ivsc3x=x(35);
ivsc3y=x(36);

ild2x=x(37);
ild2y=x(38);
ild3x=x(39);
ild3y=x(40);
ild4x=x(41);
ild4y=x(42);
ild5x=x(43);
ild5y=x(44);
ild7x=x(45);
ild7y=x(46);
ild8x=x(47);
ild8y=x(48);
ild9x=x(49);
ild9y=x(50);
ild10x=x(51);
ild10y=x(52);
ild11x=x(53);
ild11y=x(54);
ild13x=x(55);
ild13y=x(56);
ild14x=x(57);
ild14y=x(58);

ithx=x(59);
ithy=x(60);

pvsc1=x(61);
qvsc1=x(62);
pvsc2=x(63);
qvsc2=x(64);
pvsc3=x(65);
qvsc3=x(66);
uthx=x(67);
uthy=x(68);
w=x(69);

pgrid=x(70);
qgrid=x(71);

fun(1)=ivsc1x-ivscmax1; %VSC1 FSR
fun(2)=ivsc1y;

fun(3)=ivsc2x^2+ivsc2y^2-ivscmax2^2; %VSC2 PSR
fun(4)=pvsc2;

fun(5)=ivsc3x^2+ivsc3y^2-ivscmax3^2; %VSC3 FSR
fun(6)=pvsc3;

fun(7)=(uthx-u0x)-(ithx*zthx-ithy*zthy); %Thevenin Equivalent
fun(8)=(uthy-u0y)-(ithx*zthy+ithy*zthx);

fun(9)=ithx-(y0_1x*(u0x-u1x)-y0_1y*(u0y-u1y))-(y0_12x*(u0x-u12x)-y0_12y*(u0y-u12y)); %bus0 
fun(10)=ithy-(y0_1x*(u0y-u1y)+y0_1y*(u0x-u1x))-(y0_12x*(u0y-u12y)+y0_12y*(u0x-u12x));

fun(11)=ivsc1x+(y0_1x*(u0x-u1x)-y0_1y*(u0y-u1y))-(y1_2x*(u1x-u2x)-y1_2y*(u1y-u2y)); %bus1 
fun(12)=ivsc1y+(y0_1x*(u0y-u1y)+y0_1y*(u0x-u1x))-(y1_2x*(u1y-u2y)+y1_2y*(u1x-u2x));

fun(13)=(y1_2x*(u1x-u2x)-y1_2y*(u1y-u2y))-(y2_3x*(u2x-u3x)-y2_3y*(u2y-u3y))-ild2x; %bus2 
fun(14)=(y1_2x*(u1y-u2y)+y1_2y*(u1x-u2x))-(y2_3x*(u2y-u3y)+y2_3y*(u2x-u3x))-ild2y;

fun(15)=(y2_3x*(u2x-u3x)-y2_3y*(u2y-u3y))-(y3_4x*(u3x-u4x)-y3_4y*(u3y-u4y))-(y3_8x*(u3x-u8x)-y3_8y*(u3y-u8y))-ild3x; %bus3 
fun(16)=(y2_3x*(u2y-u3y)+y2_3y*(u2x-u3x))-(y3_4x*(u3y-u4y)+y3_4y*(u3x-u4x))-(y3_8x*(u3y-u8y)+y3_8y*(u3x-u8x))-ild3y;

fun(17)=(y3_4x*(u3x-u4x)-y3_4y*(u3y-u4y))-(y4_5x*(u4x-u5x)-y4_5y*(u4y-u5y))-(y4_11x*(u4x-u11x)-y4_11y*(u4y-u11y))-ild4x; %bus4 
fun(18)=(y3_4x*(u3y-u4y)+y3_4y*(u3x-u4x))-(y4_5x*(u4y-u5y)+y4_5y*(u4x-u5x))-(y4_11x*(u4y-u11y)+y4_11y*(u4x-u11x))-ild4y;

fun(19)=(y4_5x*(u4x-u5x)-y4_5y*(u4y-u5y))-(y5_6x*(u5x-u6x)-y5_6y*(u5y-u6y))-ild5x; %bus5
fun(20)=(y4_5x*(u4y-u5y)+y4_5y*(u4x-u5x))-(y5_6x*(u5y-u6y)+y5_6y*(u5x-u6x))-ild5y;

fun(21)=(y5_6x*(u5x-u6x)-y5_6y*(u5y-u6y))-(y6_7x*(u6x-u7x)-y6_7y*(u6y-u7y))+ivsc2x; %bus6
fun(22)=(y5_6x*(u5y-u6y)+y5_6y*(u5x-u6x))-(y6_7x*(u6y-u7y)+y6_7y*(u6x-u7x))+ivsc2y;

fun(23)=(y6_7x*(u6x-u7x)-y6_7y*(u6y-u7y))-(y7_8x*(u7x-u8x)-y7_8y*(u7y-u8y))-ild7x; %bus7
fun(24)=(y6_7x*(u6y-u7y)+y6_7y*(u6x-u7x))-(y7_8x*(u7y-u8y)+y7_8y*(u7x-u8x))-ild7y;

fun(25)=(y3_8x*(u3x-u8x)-y3_8y*(u3y-u8y))+(y7_8x*(u7x-u8x)-y7_8y*(u7y-u8y))-(y8_9x*(u8x-u9x)-y8_9y*(u8y-u9y))-(y8_14x*(u8x-u14x)-y8_14y*(u8y-u14y))-ild8x; %bus8
fun(26)=(y3_8x*(u3y-u8y)+y3_8y*(u3x-u8x))+(y7_8x*(u7y-u8y)+y7_8y*(u7x-u8x))-(y8_9x*(u8y-u9y)+y8_9y*(u8x-u9x))-(y8_14x*(u8y-u14y)+y8_14y*(u8x-u14x))-ild8y;

%fun(25)=(y3_8x*(u3x-u8x)-y3_8y*(u3y-u8y))-(y7_8x*(u7x-u8x)-y7_8y*(u7y-u8y))-(y8_9x*(u8x-u9x)-y8_9y*(u8y-u9y))-ild8x; %bus8
%fun(26)=(y3_8x*(u3y-u8y)+y3_8y*(u3x-u8x))-(y7_8x*(u7y-u8y)+y7_8y*(u7x-u8x))-(y8_9x*(u8y-u9y)+y8_9y*(u8x-u9x))-ild8y;

fun(27)=(y8_9x*(u8x-u9x)-y8_9y*(u8y-u9y))-(y9_10x*(u9x-u10x)-y9_10y*(u9y-u10y))-ild9x; %bus9
fun(28)=(y8_9x*(u8y-u9y)+y8_9y*(u8x-u9x))-(y9_10x*(u9y-u10y)+y9_10y*(u9x-u10x))-ild9y;

fun(29)=(y9_10x*(u9x-u10x)-y9_10y*(u9y-u10y))-(y10_11x*(u10x-u11x)-y10_11y*(u10y-u11y)); %bus10
fun(30)=(y9_10x*(u9y-u10y)+y9_10y*(u9x-u10x))-(y10_11x*(u10y-u11y)+y10_11y*(u10x-u11x));

fun(31)=(y4_11x*(u4x-u11x)-y4_11y*(u4y-u11y))+(y10_11x*(u10x-u11x)-y10_11y*(u10y-u11y))-ild11x; %bus11
fun(32)=(y4_11x*(u4y-u11y)+y4_11y*(u4x-u11x))+(y10_11x*(u10y-u11y)+y10_11y*(u10x-u11x))-ild11y;

fun(33)=(y0_12x*(u0x-u12x)-y0_12y*(u0y-u12y))-(y12_13x*(u12x-u13x)-y12_13y*(u12y-u13y))+ivsc3x-(y12x*u12x-y12y*u12y); %bus12
fun(34)=(y0_12x*(u0y-u12y)+y0_12y*(u0x-u12x))-(y12_13x*(u12y-u13y)+y12_13y*(u12x-u13x))+ivsc3y-(y12x*u12y+y12y*u12x);

fun(35)=(y12_13x*(u12x-u13x)-y12_13y*(u12y-u13y))-(y13_14x*(u13x-u14x)-y13_14y*(u13y-u14y))-ild13x; %bus13
fun(36)=(y12_13x*(u12y-u13y)+y12_13y*(u12x-u13x))-(y13_14x*(u13y-u14y)+y13_14y*(u13x-u14x))-ild13y;

fun(37)=(y8_14x*(u8x-u14x)-y8_14y*(u8y-u14y))+(y13_14x*(u13x-u14x)-y13_14y*(u13y-u14y))-ild14x; %bus14
fun(38)=(y8_14x*(u8y-u14y)+y8_14y*(u8x-u14x))+(y13_14x*(u13y-u14y)+y13_14y*(u13x-u14x))-ild14y;

%fun(37)=(y13_14x*(u13x-u14x)-y13_14y*(u13y-u14y))-ild14x; %bus14
%fun(38)=(y13_14x*(u13y-u14y)+y13_14y*(u13x-u14x))-ild14y;

fun(39)=pvsc1-(u1x*ivsc1x+u1y*ivsc1y); %vsc1
fun(40)=qvsc1-(u1y*ivsc1x-u1x*ivsc1y);
fun(41)=pvsc2-(u6x*ivsc2x+u6y*ivsc2y); %vsc2
fun(42)=qvsc2-(u6y*ivsc2x-u6x*ivsc2y);
fun(43)=pvsc3-(u12x*ivsc3x+u12y*ivsc3y); %vsc2
fun(44)=qvsc3-(u12y*ivsc3x-u12x*ivsc3y);

fun(45)=pld2*(u2x^2+u2y^2)-(u2x*ild2x+u2y*ild2y); %load2
fun(46)=qld2*(u2x^2+u2y^2)-(u2y*ild2x-u2x*ild2y);
fun(47)=pld3*(u3x^2+u3y^2)-(u3x*ild3x+u3y*ild3y); %load3
fun(48)=qld3*(u3x^2+u3y^2)-(u3y*ild3x-u3x*ild3y);
fun(49)=pld4*(u4x^2+u4y^2)-(u4x*ild4x+u4y*ild4y); %load4
fun(50)=qld4*(u4x^2+u4y^2)-(u4y*ild4x-u4x*ild4y);
fun(51)=pld5*(u5x^2+u5y^2)-(u5x*ild5x+u5y*ild5y); %load5
fun(52)=qld5*(u5x^2+u5y^2)-(u5y*ild5x-u5x*ild5y);
fun(53)=pld7*(u7x^2+u7y^2)-(u7x*ild7x+u7y*ild7y); %load7
fun(54)=qld7*(u7x^2+u7y^2)-(u7y*ild7x-u7x*ild7y);
fun(55)=pld8*(u8x^2+u8y^2)-(u8x*ild8x+u8y*ild8y); %load8
fun(56)=qld8*(u8x^2+u8y^2)-(u8y*ild8x-u8x*ild8y);
fun(57)=pld9*(u9x^2+u9y^2)-(u9x*ild9x+u9y*ild9y); %load9
fun(58)=qld9*(u9x^2+u9y^2)-(u9y*ild9x-u9x*ild9y);
fun(59)=pld10*(u10x^2+u10y^2)-(u10x*ild10x+u10y*ild10y); %load10
fun(60)=qld10*(u10x^2+u10y^2)-(u10y*ild10x-u10x*ild10y);
fun(61)=pld11*(u11x^2+u11y^2)-(u11x*ild11x+u11y*ild11y); %load11
fun(62)=qld11*(u11x^2+u11y^2)-(u11y*ild11x-u11x*ild11y);
fun(63)=pld13*(u13x^2+u13y^2)-(u13x*ild13x+u13y*ild13y); %load13
fun(64)=qld13*(u13x^2+u13y^2)-(u13y*ild13x-u13x*ild13y);
fun(65)=pld14*(u14x^2+u14y^2)-(u14x*ild14x+u14y*ild14y); %load14
fun(66)=qld14*(u14x^2+u14y^2)-(u14y*ild14x-u14x*ild14y);

fun(67)=pgrid-(u0x*ithx+u0y*ithy); %pq grid
fun(68)=qgrid-(u0y*ithx-u0x*ithy);

fun(69)=uth^2-(uthx^2+uthy^2);
fun(70)=w-(w0-k_w*(pvsc1-p0_gf)); %grid forming converter frequency support
fun(71)=w-(w0-k_pw*pgrid);

end