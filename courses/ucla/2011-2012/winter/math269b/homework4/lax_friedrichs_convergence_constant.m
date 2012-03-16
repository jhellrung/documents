function C = lax_friedrichs_convergence_constant(a, T, u0, lambdas)

    C = zeros(size(lambdas));
    h0 = 1/16;

    for i = 1:length(lambdas)
        lambda = lambdas(i);
        hs = [];
        e = [];
        h = h0;
        while 1
            M = round(1/h);
            h = 1/M;
            k = lambda*h;
            N = ceil(T/k);
            k = T/N;
            x = (0:M)/M;
            v = u0(x);
            for n = 1:N
                v = lax_friedrichs(v,a,k,h);
            endfor
            hs(end+1) = h;
            e(end+1) = sqrt(h) * norm((u0(mod(x-a*T,1))-v)(1:end-1));
            if length(e) == 5
                r = corr(log(hs), log(e));
                if r >= 0.99
                    p = polyfit(log(hs), log(e), 1);
                    C(i) = exp(p(2));
                    disp(["lambda = " num2str(lambda) ", C = " num2str(C(i))]);
                    break;
                endif
                hs = hs(2:end);
                e = e(2:end);
                h0 = hs(1);
                h0
            endif
            h *= 2^(-1/2);
        endwhile
    endfor

endfunction
