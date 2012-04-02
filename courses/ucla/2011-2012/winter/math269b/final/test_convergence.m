function test_convergence(T, scheme, scheme_name, hs, k_of_h)

    e = zeros(size(hs));

    for i = 1:length(hs)
        h = hs(i);
        M = round(4/h);
        h = 4/M;
        k = k_of_h(h);
        N = ceil(T/k);
        k = T/N;
        x = 4*(0:M)/M;
        v = burgers_solution(0,x);
        for n = 1:N
            v = scheme(v,k,h);
        endfor
        e(i) = sqrt(h) * norm((burgers_solution(T,x) - v)(1:end-1));
    endfor

    p = polyfit(log(hs), log(e), 1);
    plot(log(hs), log(e), "o", log(hs), polyval(p,log(hs)));
    title(["convergence plot for " scheme_name]);
    legend("L2error vs h", [num2str(exp(p(2))) " * h^" num2str(p(1))], "location", "northwest");
    xlabel("log(h)");
    ylabel("log(L2error)");

endfunction
