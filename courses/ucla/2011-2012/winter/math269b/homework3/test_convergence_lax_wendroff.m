function test_convergence_lax_wendroff(a, T, hs, lambda)

    aK = @(k,h,K) a * (1 - (2/3)*pi^2*K^2*(h^2 - a^2*k^2));
    uK = @(k,h,K,t,x) cos(2*pi*K*(x - aK(k,h,K)*t));
    u = @(k,h,t,x) uK(k,h,1,t,x) - 2*uK(k,h,2,t,x) + 3*uK(k,h,3,t,x);
    test_convergence( ...
        a, T, u, ...
        @lax_wendroff, "Lax-Wendroff", ...
        hs, @(h) lambda*h);

endfunction
