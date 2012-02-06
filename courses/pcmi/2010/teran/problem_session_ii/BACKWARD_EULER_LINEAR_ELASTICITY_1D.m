function u=BACKWARD_EULER_LINEAR_ELASTICITY_1D(a,b,u_a,uN,vN,dt,g,f,beta,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% This function returns the solution (u) to the spatially varying coefficient
%% heat equation over the interval [a,b].
%%
%% Input:
%%
%% a,b     - bounds of the domain
%% u_a     - Dirichlet boundary conditions at the left end of the domain
%% g       - this is the Neumann boundary condition applied at the right
%% f       - forcing term defined at each grid cell center
%% beta    - Poisson equation coefficient defined at each grid cell center
%% n       - number of points in the domain (including the Dirichlet ends)
%%
%% uN      - time n displacements
%% vN      - time n velocities
%% dt      - time step size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dx=(b-a)/(n-1);
x=dx*(0:(n-1))+a;

num_elements=n-1;

%need to take into account the fact that not all nodes are dofs
node_to_dof_map=0:(n-1);
node_to_dof_map(1)=0;
A=zeros(n-1);
M_plus_dt_squared_A=zeros(n-1);
rhs=zeros(n-1,1);
dirichlet_vector=zeros(n,1);
dirichlet_vector(1)=u_a;
dirichlet_force=zeros(n,1);
inertia_force=zeros(n,1);

for e=1:num_elements
    mesh(e,1)=e;mesh(e,2)=e+1;
    Ae(1,1)=beta(e)/dx;Ae(1,2)=-beta(e)/dx;
    Ae(2,1)=-beta(e)/dx;Ae(2,2)=beta(e)/dx;
    
    Me(1,1)=1/3;Me(1,2)=1/6;
    Me(2,1)=1/6;Me(2,2)=1/3;
    
    for i=1:2
        for j=1:2
            dirichlet_force(mesh(e,i))=dirichlet_force(mesh(e,i))+(Me(i,j)+dt*dt*Ae(i,j))*dirichlet_vector(mesh(e,j));
            inertia_force(mesh(e,i))=inertia_force(mesh(e,i))+Me(i,j)*(uN(mesh(e,j))+dt*vN(mesh(e,j)));
        end
    end
   
    for i=1:2
        if node_to_dof_map(mesh(e,i))~=0
            rhs(node_to_dof_map(mesh(e,i)))=dt*dt*rhs(node_to_dof_map(mesh(e,i)))+.5*f(e)*dx;
            for j=1:2
              if node_to_dof_map(mesh(e,j))~=0
                A(node_to_dof_map(mesh(e,i)),node_to_dof_map(mesh(e,j)))=A(node_to_dof_map(mesh(e,i)),node_to_dof_map(mesh(e,j)))+Ae(i,j);
                M_plus_dt_squared_A(node_to_dof_map(mesh(e,i)),node_to_dof_map(mesh(e,j)))=M_plus_dt_squared_A(node_to_dof_map(mesh(e,i)),node_to_dof_map(mesh(e,j)))+Me(i,j)+dt*dt*Ae(i,j);
              end
            end
        end
    end 
end

for i=1:n
    if node_to_dof_map(i)~=0
        rhs(node_to_dof_map(i))=rhs(node_to_dof_map(i))-dirichlet_force(i)+inertia_force(i);
    end
end

rhs(n-1)=dt*dt*g;

%solve the discreet system
u=M_plus_dt_squared_A\rhs;

u_full(1)=u_a;
for i=2:n
    u_full(i)=u(i-1);   
end
u=u_full;