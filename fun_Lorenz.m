function y=fun_Lorenz(x,u)
y=[80.*(x(2,:)-x(1,:));
    x(1,:).*(180-x(3,:))-x(2,:);
    x(1,:).*x(2,:)-25.*x(3,:)]+u;
end 