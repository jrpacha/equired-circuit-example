function df = dfunFFF(x,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q)
numVars = length(x);
eps = 0.00001;
for i = 1:numVars
    h = x;
    h(i) = x(i) + eps;
    df(:,i) = funFFF(h,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q);
    h(i) = x(i) - eps;
    df(:,i) = df(:,i) - funFFF(h,Yg,pavsc,sload,uth,zth,k_w,k_pw,w0,k_q);
    df(:,i) = df(:,i)/2.0/eps;
end

end