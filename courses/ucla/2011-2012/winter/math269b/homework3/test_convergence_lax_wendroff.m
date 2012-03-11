function test_convergence_lax_wendroff(a, T, hs, lambda)

    aK = @(h,k,K) a * (1 - (2/3)*pi^2*K^2*(h^2 - a^2*k^2));
    uK = @(h,k,K,t,x) cos(2*pi*K*(x - aK(h,k,K)*t));
    u = @(h,k,t,x) uK(h,k,1,t,x) - 2*uK(h,k,2,t,x) + 3*uK(h,k,3,t,x);
    test_convergence( ...
        a, T, u, ...
        @lax_wendroff, "Lax-Wendroff", ...
        hs, @(h) lambda*h);

endfunction
