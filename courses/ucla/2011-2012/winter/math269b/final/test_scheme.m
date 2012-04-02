function test_scheme(scheme, scheme_name, k, h)

    T = 1;

    M = round(4/h);
    h = 4/M;
    N = ceil(T/k);
    k = T/N;
    x = 4*(0:M)/M;
    v = burgers_solution(0,x);
    plot(x, v, "o-");
    hold on;
    for n = 1:N
        v = scheme(v,k,h);
        if mod(k*(n+1/2),1) <= k
        %if mod(k*(n+1/2),1/2) <= k
            plot(x, v, "o-");
        endif
    endfor
    hold off;

    title(["Numerical solutions at t = i/2 using " scheme_name]);
    xlabel("x");
    ylabel("v^n_m");

    e = sqrt(h) * norm((burgers_solution(T,x) - v)(1:end-1));
    disp(["error = " num2str(e)]);

endfunction
