%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% example0.m
% Distributed under the Boost Software License, Version 1.0.  (See accompanying
% file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = 0;
xn = 1;
n = 17; % # of grid vertices
X = (x1 + (0:n-1)*(xn-x1)/n)';

E = 1000; % Young's modulus
nu = 0.3; % Poisson's ratio
lambda = E * nu / ((1 + nu) * (1 - 2 * nu));
mu     = E / (2 * (1 + nu));

dirichlet_flag1 = 1;
g1 = @(t) sin(t);
dirichlet_flagn = 0;
gn = @(t) 0;

h1 = @(t) 0; % Neumann boundary condition @ x1 (if applicable)
hn = @(t) 0; % Neumann boundary condition @ xn (if applicable)

fext = @(t) zeros([n-1 1]);

T = 2*pi;
dt = T / 32;

u = zeros([n 1]);

handle = axes;
hold on;

for t = 0:dt:T
    disp(['Computing u(.,', num2str(t), ')...']);
    u = solve( ...
        x1, xn, n, ...
        mu, lambda, ...
        dirichlet_flag1, g1(t), dirichlet_flagn, gn(t), ...
        h1(t), hn(t), ...
        fext(t), ...
        1e-15, u);
    plot(handle, X + u, t, 'o-', 'MarkerSize', 4, 'LineWidth', 1);
    axis([-1 2 0 T]);
end

hold off;
