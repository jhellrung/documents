function v = ftcs(v, a, k, h)
    % (1/k)*(v^{n+1}_m - v^n_m) + (a/(2*h))*(v^n_{m+1} - v^n_{m-1}) = 0
    v = v - (a*k/(2*h))*([v(2:end) v(2)] - [v(end-1) v(1:end-1)]);
endfunction
