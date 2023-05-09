function [X,S] = cont(x0,s0,ds,smax,sgn,tol,itmax,f,Df)
%Numerical continuation of the curve defined by the equation f=0, 
% f:R^{N+1}->R^N 
%INPUT
%    x0: approximation of a point on the curve
%    ds: pseudo-arc length (here fixed). TODO: adaptative step. Is it worth?
%  smax: maximum pseudo-arc length
%   sgn: (+1 or -1) fixes the direction along the curve
%     f: name of the function. f = 0 defines the curve
%    Df: function's partial derivatives' matrix name
%OUTPUT
%     X: matrix (N+1)xM. The columns X(:,1),...,X(:,M) are the points on
%     the curve.

s = s0;
S = [s];
b = x0(:); b(1:end) = 0.0; b(end) = 1.0;

%Find the tangent to the 1st. point
%v = sgn*null(DFk(1:end-1,:));
%X = [XK(:,end)];
v = sgn*null(Df(x0));
X = [x0];

%dist = 1;
nsteps=floor(smax/ds);

while s < smax %& dist > ds %2nd.condition is specific for this problem (closed curves)
    if s+ds > smax
        ds=smax-s;
    end      
    x0 = X(:,end)+ds*v;
    F = @(x) [f(x);dot(x-X(:,end),v)-ds];
    DF = @(x)[Df(x);v'];
    [XK,DFk,res,it] = nnewton(x0,tol,itmax,F,DF);
    X = [X,XK(:,end)];    
    M = [DFk(1:end-1,:);v'];
    v = M\b;
    v = v/norm(v);
    s = s+ds;
    S = [S, s];
    %dist = norm(X(:,end)-X(:,1)); %since these're closed curves
end
end