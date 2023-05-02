function Jfun=JfunFFF(x,h,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q)
n = length(x);
Jfun = zeros(n);
for i = 1:n
    x1 = x; x2 = x;
    x1(i) = x(i) + h;
    x2(i) = x(i) - h;
    fun1 = funFFF(x1,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q);
    fun2 = funFFF(x2,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q);
    Jfun(:,i) = (fun1-fun2)/2/h;
end
        
end