function dx = fun_NMM(x,u)

A=3.25;
B=22;
a=100;
b=50;
C=135;
p_t=200;

C1=C;
C2=C*0.8;
C3=C/4;
C4=C/4;
dx=[x(4);
    x(5);
    x(6);
    A*a*f(x(2)-x(3))-2*a*x(4)-a*a*x(1);
    A*a*C2*f(C1*x(1))-2*a*x(5)-a*a*x(2)+A*a*p_t;
    B*b*C4*f(C3*x(1))-2*b*x(6)-b*b*x(3);
    ]+A*a*u;

% disp(size(A*a*C2*f(C1*x(1))-2*a*x(5)-a*a*x(2)+A*a*p_t))
% disp(size(B*b*C4*f(C3*x(1))-2*b*x(6)-b*b*x(3)))
% disp(size(dx))
% disp('\n')
return

function y=f(v)
e0=2.5;
r=0.56;
v0=6;
y=2*e0./(1+exp(r.*(v0-v)));
return