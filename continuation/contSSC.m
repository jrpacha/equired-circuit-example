function [X,S,DS,R] = contSSC(x0,s0,ds0,smax,sgn,tol,itmax,f,Df)
%Numerical continuation of the curve defined by the equation f=0, 
% f:R^{N+1}->R^N with pseudo-arc Step Size Control
%INPUT
%    x0: approximation of a point on the curve
%    s0: initial value of the pseudo-arc 
%   ds0: initial value of the pseudo-arc step. The size of the arc step
%        is adapted at each after some estimation of the curvature.
%  smax: maximum pseudo-arc length, so the continuation is performed from
%        s = s0 to s = smax.
%   sgn: (+1 or -1) fixes the direction along the curve
%     f: name of the function. f = 0 defines the curve
%    Df: function's partial derivatives' matrix name
%OUTPUT
%     X: (N+1)x M array. It's columns, X(:,1),...,X(:,M) are the points on
%        the curve
%     S: 1 x (N+1) array with the values of the pseudo-arc, s, at each step 
%    DS: 1 x (N+1) array with the values of the pseudo-arc-step, ds, at
%        each step
%     R: 1 x (N+1) array holding the residuals of the approximations
%        computed for the points on the continuation curve. More precisely,
%        R(i) = ||f(X(1,i),X(2,i),...,X(N+1,i))||, i = 1,...,M

s = s0;
S = [s];
b = x0(:); b(1:end) = 0.0; b(end) = 1.0;

v0 = sgn*null(Df(x0));
X = [x0];

%ds0 = min(ds0, 0.1); %max pseudoarc-stepsize = 0.1;
ds = ds0;
minPseudoAS = 1.0e-5;
DS = [ds];
R = [];
step = 0;
%nsteps=floor(smax/ds); %Set a maximun number of steps?

while s < smax

    if s+ds > smax
        ds=smax-s;
    end

    step = step+1;
    fprintf('- contSSC. Step Num: %4d\n',step)

    while true
        x0 = X(:,end)+ds*v0;
        F = @(x) [f(x);dot(x-X(:,end),v0)-ds];
        DF = @(x)[Df(x);v0'];
        [XK,DFk,res,it] = nnewton(x0,tol,itmax,F,DF);
        M = [DFk(1:end-1,:);v0'];
        v = M\b;
        v = v/norm(v);
        if v0'*v < 0.99 || it >= itmax
            ds = 0.33*ds;
            fprintf('\tReduce stepsize, ds = %e\n', ds)
            if ds < 1.0e-5
                error('\tds = %e < %e: pseudo-arc step too small\n',...
                    ds,minPseudoAS)
            end
            continue
        else
            s = s + ds;
            S = [S, s];
            DS = [DS, ds];

            if v0'*v > 0.99
                ds = ds0;
            end
            
            X = [X, XK(:,end)];            
            v0 = v;
            R = [R, res(end)];

            fprintf('\t - Step succeeded, res = %.5e\n',res(end))

            break
        end
    end
end
end %end function contSSC 