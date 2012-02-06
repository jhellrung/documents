clear all;

a=0;
b=2*pi;

n=10;
dx=(b-a)/(n-1);

X=dx*(0:(n-1))+a;
vN=zeros(n,1);
uN=zeros(n,1);
uN(n)=2;

for i=1:n-1
   beta(i)=.5*(X(i)+X(i+1))+1;
   f(i)=0;
end

u_a=0;
g=0;
T_final=5;
frames_per_second=30;
substeps_per_frame=10;
N=T_final*frames_per_second*substeps_per_frame;

dt=T_final/(N-1);
time=0;

x=X+uN';
hold off;
clf;
plot(x,1,'X-','MarkerSize',10,'LineWidth',2);
axis([0 2*pi .9 1.1]);
frame=1;
M(frame)=getframe;

for t=1:N
    %reply = input('Hit enter for the next frame: ', 's');
    time=time+dt;
    u=BACKWARD_EULER_LINEAR_ELASTICITY_1D(a,b,u_a,uN,vN,dt,g,f,beta,n);
    %u=POISSON_1D(a,b,u_a,0,f,beta,n,0);
    x=X+u;
    vN=(u'-uN)/dt;
    if mod(t,substeps_per_frame)==0
        frame=frame+1
        hold off;
        clf;
        plot(x,1,'X-','MarkerSize',10,'LineWidth',2);
        axis([0 2*pi .9 1.1]);
        M(frame)=getframe;
    end
end