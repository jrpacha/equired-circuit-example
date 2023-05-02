function [XK,DFk,res,it] = nnewton(x0,tol,itmax,fun,Dfun)
%INPUT 
%     x0: initial guess (column vector)
%    tol: tolerance so that ||x_{k+1} - x_{k} || < tol
%  itmax: maximum number of iterations
%    fun: function's name
%   Dfun: function's partial derivatives' matrix name
%
%OUTPUT
%     XK: matrix. The columns hold the successive approximations to the
%         solution
%    DFk: derivative of fun at the last iterate point
%    res: resulting residuals of iteration, i.e., res_k := ||F_k||
%     it: number of required iterations to satisfy tolerance
%
% Adapted from: 
% Meseguer, Alvaro: Fundamentals of Numerical Mathematics for Physicist
% and Engineers. ED Wiley and Sons., 2020. Sec.6.1,p.214

errormsg = 'nnewton: no convergence after %d iterates. tolk = %.5e\n';
    
x0 = x0(:);
xk = x0;
res = norm(fun(xk)); 
XK = [x0]; 
it = 0;
tolk = 1.0; 
while it < itmax && tolk > tol
    Fk = fun(xk);
    DFk = Dfun(xk);
    dxk = -DFk\Fk;
    xk = xk + dxk; 
    XK = [XK xk]; 
    res = [res norm(Fk)];
    tolk = norm(dxk);
    it = it + 1;
end

if it >= itmax && tolk > tol
    warning(errormsg,itmax,tolk)
end