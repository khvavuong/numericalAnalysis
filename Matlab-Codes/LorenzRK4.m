A=[0;1;2];
f1=@(x,y,z)10*(y-x);
f2=@(x,y,z)23*x-y-x*z;
f3=@(x,y,z)x*y-8/3*z;
t0 = -10;
T = 10;
h=0.0001;
t = t0:h:T;
n = length(t);
Y = zeros(3,n);
Y(:,1)=A;
for j = 1:n-1
    K1 = h*[f1(Y(1,j),Y(2,j),Y(3,j));...
        f2(Y(1,j),Y(2,j),Y(3,j)); f3(Y(1,j),Y(2,j),Y(3,j))];
    K2 = h*[f1(Y(1,j)+K1(1)/2,Y(2,j)+K1(2)/2,Y(3,j)+K1(3)/2);...
        f2(Y(1,j)+K1(1)/2,Y(2,j)+K1(2)/2,Y(3,j)+K1(3)/2);...
        f3(Y(1,j)+K1(1)/2,Y(2,j)+K1(2)/2,Y(3,j)+K1(3)/2)];
    K3 = h*[f1(Y(1,j)+K2(1)/2,Y(2,j)+K2(2)/2,Y(3,j)+K2(3)/2);...
        f2(Y(1,j)+K2(1)/2,Y(2,j)+K2(2)/2,Y(3,j)+K2(3)/2);...
        f3(Y(1,j)+K2(1)/2,Y(2,j)+K2(2)/2,Y(3,j)+K2(3)/2)];
    K4 = h*[f1(Y(1,j)+K3(1),Y(2,j)+K3(2),Y(3,j)+K3(3));...
        f2(Y(1,j)+K3(1),Y(2,j)+K3(2),Y(3,j)+K3(3));...
        f3(Y(1,j)+K3(1),Y(2,j)+K3(2),Y(3,j)+K3(3))];
    Y(:,j+1)=Y(:,j)+1/6*(K1+2*K2+2*K3+K4);
end
plot(t,Y(1,:));
hold on
plot(t,Y(2,:));
plot(t,Y(3,:));
legend('x(t)','y(t)','z(t)');

