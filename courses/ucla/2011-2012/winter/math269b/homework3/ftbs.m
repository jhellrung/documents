function v = ftbs(v, a, k, h)
    % (1/k)*(v^{n+1}_m - v^n_m) + (a/h)*(v^n_m - v^n_{m-1}) = 0
    M = length(v) - 1;
    v = (1 - a*k/h)*v + (a*k/h)*v([M 1:M]);
endfunction
