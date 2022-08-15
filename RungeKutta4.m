function y=RungeKutta4(fun,dt,x,u)
    k1=fun(x,u(:,1));
    k2=fun(x+dt*k1/2,u(:,2));
    k3=fun(x+dt*k2/2,u(:,2));
    k4=fun(x+dt*k3,u(:,3));
    y=x+(dt/6).*(k1+2*k2+2*k3+k4);
end