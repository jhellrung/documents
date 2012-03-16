function test_convergence_lax_wendroff_btcs(a, b, T, hs, k_of_h)

    uK = @(K,t,x) ...
         exp(-4*pi^2*K^2*b*t) ...
      .* cos(2*pi*K*(x - a*t));
    u = @(t,x) uK(1,t,x) - 2*uK(2,t,x) + 3*uK(3,t,x);

    e = zeros(size(hs));

    for i = 1:length(hs)
        h = hs(i);
        M = round(1/h);
        h = 1/M;
        k = k_of_h(h);
        N = ceil(T/k);
        k = T/N;
        x = (0:M)/M;
        v = u(0,x);
        for n = 1:N
            v = lax_wendroff_btcs(v,a,b,k,h);
        endfor
        e(i) = sqrt(h) * norm((u(T,x) - v)(1:end-1));
    endfor

    p = polyfit(log(hs), log(e), 1);
    plot(log(hs), log(e), "o", log(hs), polyval(p,log(hs)));
    title(["convergence plot for Lax-Wendroff + backward-time central-space"]);
    legend("L2error vs h", [num2str(exp(p(2))) " * h^" num2str(p(1))], "location", "northwest");
    xlabel("log(h)");
    ylabel("log(L2error)");

endfunction
