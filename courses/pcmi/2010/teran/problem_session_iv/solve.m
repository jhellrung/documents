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
    tris, X, tri_areas, ...
    rho, fext, mu, lambda, ...
    h, ...
    dirichlet_vertices, dirichlet_values, ...
    u0, v0, ...
    dt, ...
    tol, u)
% tris(k,:)    = the 3 grid vertices within triangle k
% X(a,:)       = the coordinates of grid vertex a
% tri_areas(k) = the area of triangle k
% rho(k)       = the mass density within triangle k
% fext(a,:)    = the external force on grid vertex a
% mu           = mu
% lambda       = lambda
% h(a,:)       = the Neumann boundary condition on grid vertex a
% dirichlet_vertices = list of grid vertices on which to apply dirichlet conditions
% dirichlet_values   = corresponding list of dirichlet values
% u0(a,:)      = the previous time-step's displacement at grid vertex a
% v0(a,:)      = the previous time-step's velocity at grid vertex a
% dt           = the time-step increment
% tol          = convergence tolerance
% u            = initial guess
b = eval_b(tris, X, tri_areas, rho, fext, h, u0, v0, dt);
for i = 1:length(dirichlet_vertices)
    u(dirichlet_vertices(i),:) = dirichlet_values(i,:);
end
n = size(X,1);
delta_u = inf([n 2]);
while max(max(abs(delta_u))) > tol
    dq_du = eval_dq_du(tris, X, tri_areas, rho, mu, lambda, u, dt);
    q     = eval_q    (tris, X, tri_areas, rho, mu, lambda, u, b, dt);
    for i = 1:length(dirichlet_vertices)
        a = dirichlet_vertices(i);
        dq_du(2*a-1,:) = 0;
        dq_du(2*a  ,:) = 0;
        dq_du(:,2*a-1) = 0;
        dq_du(:,2*a  ) = 0;
        dq_du(2*a-1,2*a-1) = 1;
        dq_du(2*a  ,2*a  ) = 1;
        q(a,:) = [0 0];
    end
    delta_u = reshape(dq_du \ reshape(-q', [2*n 1]), [2 n])';
    u = u + delta_u;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function eval_b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function b = eval_b(tris, X, tri_areas, rho, fext, h, u0, v0, dt)
% tris(k,:)    = the 3 grid vertices within triangle k
% X(a,:)       = the coordinates of grid vertex a
% tri_areas(k) = the area of triangle k
% rho(k)       = the mass density within triangle k
% fext(a,:)    = the external force on grid vertex a
% h(a,:)       = the Neumann boundary condition on grid vertex a
% u0(a,:)      = the previous time-step's displacement at grid vertex a
% v0(a,:)      = the previous time-step's velocity at grid vertex a
% dt           = the time-step increment
b = dt^2 * h;
for k = 1:size(tris,1)
    tri = tris(k,:);
    b(tri,:) = b(tri,:) + ...
        tri_areas(k) * [2 1 1;1 2 1;1 1 2]/12 * ...
        (rho(k) * (u0(tri,:) + dt * v0(tri,:)) + dt^2 * fext(tri,:));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function eval_q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function q = eval_q(tris, X, tri_areas, rho, mu, lambda, u, b, dt)
% tris(k,:)    = the 3 grid vertices within triangle k
% X(a,:)       = the coordinates of grid vertex a
% tri_areas(k) = the area of triangle k
% rho(k)       = the mass density within triangle k
% mu           = mu
% lambda       = lambda
% u(a,:)       = the vector of u_i's at grid vertex a
% b(a,:)       = the vector of b_i's at grid vertex a
% dt           = the time-step increment
q = -b;
for k = 1:size(tris,1)
    tri = tris(k,:);
    dN_dX = [X(tri,:)';1 1 1] \ [1 0;0 1;0 0];
    F     = u(tri,:)' * dN_dX + [1 0;0 1];
    J     = det(F);
    dJ_dF = [F(2,2) -F(2,1);-F(1,2) F(1,1)];
    rJ    = (J-1) - (J-1)^2 / 2 + (J-1)^3 / 3;
    drJ   = 1 - (J-1) + (J-1)^2;
    P     = mu * F + (lambda * rJ - mu) * drJ * dJ_dF;
    q(tri,:) = q(tri,:) + tri_areas(k) * ( ...
        rho(k) * [2 1 1;1 2 1;1 1 2]/12 * u(tri,:) + dt^2 * (dN_dX * P') ...
    );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function eval_dq_du
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dq_du = eval_dq_du(tris, X, tri_areas, rho, mu, lambda, u, dt)
% tris(k,:)    = the 3 grid vertices within triangle k
% X(a,:)       = the coordinates of grid vertex a
% tri_areas(k) = the area of triangle k
% rho(k)       = the mass density within triangle k
% mu           = mu
% lambda       = lambda
% u(a,:)       = the vector of u_i's at grid vertex a
% dt           = the time-step increment
n = size(X,1);
dq_du_vals = zeros([4 * 9 * size(tris,1) 1]);
dq_du_rows = dq_du_vals;
dq_du_cols = dq_du_vals;
index = 1;
for k = 1:size(tris,1)
    tri = tris(k,:);
    dN_dX = [X(tri,:)';1 1 1] \ [1 0;0 1;0 0];
    F     = u(tri,:)' * dN_dX + [1 0;0 1];
    J     = det(F);
    dJ_dF = [F(2,2) -F(2,1);-F(1,2) F(1,1)];
    rJ    = (J-1) - (J-1)^2 / 2 + (J-1)^3 / 3;
    drJ   = 1 - (J-1) + (J-1)^2;
    d2rJ  = -1 + 2 * (J-1);
    c1    = lambda * drJ^2 + (lambda * rJ - mu) * d2rJ;
    c2    = (lambda * rJ - mu) * drJ;
    for i = 1:2
        for j = 1:2
            dPik_dFjm = c1 * dJ_dF(i,:)' * dJ_dF(:,j)';
            dPik_dFjm(i,j) = dPik_dFjm(i,j) + mu;
            if(i != j)
                dPik_dFjm(i,j) = dPik_dFjm(i,j) + c2;
                dPik_dFjm(j,i) = dPik_dFjm(j,i) - c2;
            end
            local_dq_du = dt^2 * dN_dX * dPik_dFjm * dN_dX';
            if(i == j)
                local_dq_du = local_dq_du + rho(k) * [2 1 1;1 2 1;1 1 2]/12;
            end
            local_dq_du = tri_areas(k) * local_dq_du;
            for a = 1:3
                for b = 1:3
                    r = 2 * tri(a) + i - 2;
                    c = 2 * tri(b) + j - 2;
                    dq_du_vals(index) = local_dq_du(a,b);
                    dq_du_rows(index) = r;
                    dq_du_cols(index) = c;
                    index = index + 1;
                end
            end
        end
    end
end
dq_du = sparse(dq_du_rows, dq_du_cols, dq_du_vals, 2*n, 2*n);
