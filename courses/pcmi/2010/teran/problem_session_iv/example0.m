%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example0.m
% Distributed under the Boost Software License, Version 1.0.  (See accompanying
% file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n1 = 4;
n2 = 4;
n = n1 * n2;
N = 2 * (n1 - 1) * (n2 - 1);

tris = zeros([N 3]);
for i = 1:n1-1
    for j = 1:n2-1
        a = n2*(i-1) + j;
        k = (n2-1)*(i-1) + j;
        tris(2*k-1,:) = [a   a+n2 a+1   ];
        tris(2*k  ,:) = [a+1 a+n2 a+n2+1];
    end
end
X = zeros([n 2]);
for i = 1:n1
    for j = 1:n2
        X(n2*(i-1)+j,:) = [ ...
            (-1*(n1-i) + 1*(i-1))/(n1-1) ...
            (-1*(n2-j) + 1*(j-1))/(n2-1) ...
        ];
    end
end

tri_areas = zeros([N 1]);
for k = 1:N
    tri_areas(k) = det([X(tris(k,:),:)';1 1 1]) / 2;
end

rho = ones([N 1]);
fext = @(t) zeros([n 2]);

E = 1000; % Young's modulus
nu = 0.3; % Poisson's ratio
lambda = E * nu / ((1 + nu) * (1 - 2 * nu));
mu     = E / (2 * (1 + nu));

h = @(t) zeros([n 2]);

dirichlet_vertices = [1:n2 (n1-1)*n2+1:n];
dirichlet_values = @(t) [sin(t) * [-ones([n2 1]);ones([n2 1])] zeros([2*n2 1])];

T = 2*pi;
dt = T / 1024;

u = zeros([n 2]);
v = zeros([n 2]);

handle = axes;
hold on;

for t = 0:dt:3*dt
    disp(['Computing u(.,', num2str(t), ')...']);
    u1 = solve( ...
        tris, X, tri_areas, ...
        rho, fext(t), mu, lambda, ...
        h(t), ...
        dirichlet_vertices, dirichlet_values(t), ...
        u, v, ...
        dt, ...
        1e-15, u);
    v = (u1 - u) / dt;
    u = u1;
    x = X + u;
    patch(handle, 'Faces', tris, 'Vertices', [x t*ones([n 1])]);
end

hold off;
