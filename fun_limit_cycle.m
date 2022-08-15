function y=fun_limit_cycle(x,u)
c=60;
k=10;
r=sqrt(x(1)^2+x(2)^2);
y=[k*x(1)/r-k*x(1)-x(2)*c;
    k*x(2)/r-k*x(2)+x(1)*c]+u;
end