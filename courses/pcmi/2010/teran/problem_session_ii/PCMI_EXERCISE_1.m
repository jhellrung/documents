clear all;

a=0;
b=2*pi;

n=1000;
dx=(b-a)/(n-1);

x=dx*(0:(n-1))+a;
for i=1:n-1
   %beta(i)=.5*(x(i)+x(i+1))+1;
   beta(i)=1;
   f(i)=sin(.5*(x(i)+x(i+1)));
end

u_a=1;
g=1;

u=POISSON_1D(a,b,u_a,g,f,beta,n,1);