function v = ftcs(v, a, k, h)
    % (1/k)*(v^{n+1}_m - v^n_m) + (a/(2*h))*(v^n_{m+1} - v^n_{m-1}) = 0
    M = length(v) - 1;
    v = v - (a*k/(2*h))*(v([2:M 1:2]) - v([M 1:M]));
endfunction
