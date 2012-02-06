%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% solve.m
% Copyright 2010, Jeffrey Hellrung.
% Distributed under the Boost Software License, Version 1.0.  (See accompanying
% file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function solve
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function u = solve( ...
    x1, xn, n, ...
    mu, lambda, ...
    dirichlet_flag1, g1, dirichlet_flagn, gn, ...
    h1, hn, ...
    fext, ...
    tol, u)
b = construct_b(x1, xn, n, fext, h1, hn);
if dirichlet_flag1
    u(1) = g1;
end
if dirichlet_flagn
    u(n) = gn;
end
delta_u = inf([n 1]);
while max(abs(delta_u)) > tol
    dq_du = eval_dq_du(x1, xn, n, mu, lambda, u);
    q     = eval_q    (x1, xn, n, mu, lambda, b, u);
    if dirichlet_flag1
        dq_du(1,1) = 1;
        dq_du(1,2) = 0;
        dq_du(2,1) = 0;
        q(1) = 0;
    end
    if dirichlet_flagn
        dq_du(n,n) = 1;
        dq_du(n,n-1) = 0;
        dq_du(n-1,n) = 0;
        q(n) = 0;
    end
    delta_u = dq_du \ -q;
    u = u + delta_u;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function construct_b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function b = construct_b(x1, xn, n, fext, h1, hn)
b = zeros([n 1]);
dX = (xn - x1) / (n - 1);
for i = 1:n-1
    b(i  ) = b(i  ) + fext(i) * dX / 2;
    b(i+1) = b(i+1) + fext(i) * dX / 2;
end
b(1) = b(1) + h1;
b(n) = b(n) + hn;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function eval_q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function q = eval_q(x1, xn, n, mu, lambda, b, u)
q = -b;
dX = (xn - x1) / (n - 1);
for i = 1:n-1
    du_dx = (u(i+1) - u(i)) / dX;
    r     = du_dx - du_dx^2 / 2 + du_dx^3 / 3;
    dr    = 1 - du_dx + du_dx^2;
    P     = mu * (du_dx + 1) + (lambda * r - mu) * dr;
    q(i  ) = q(i  ) - P;
    q(i+1) = q(i+1) + P;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function eval_dq_du
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dq_du = eval_dq_du(x1, xn, n, mu, lambda, u)
dq_du = sparse([1:n 2:n 1:n-1], [1:n 1:n-1 2:n], 0);
dX = (xn - x1) / (n - 1);
for i = 1:n-1
    du_dx = (u(i+1) - u(i)) / dX;
    r     = du_dx - du_dx^2 / 2 + du_dx^3 / 3;
    dr    = 1 - du_dx + du_dx^2;
    d2r   = -1 + 2 * du_dx;
    dP_dF = mu + lambda * dr^2 + (lambda * r - mu) * d2r;
    dq_du(i  ,i  ) = dq_du(i  ,i  ) + dP_dF / dX;
    dq_du(i  ,i+1) = dq_du(i  ,i+1) - dP_dF / dX;
    dq_du(i+1,i  ) = dq_du(i+1,i  ) - dP_dF / dX;
    dq_du(i+1,i+1) = dq_du(i+1,i+1) + dP_dF / dX;
end
