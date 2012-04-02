function v = lax_friedrichs_advective(v, k, h)
    % (1/k)*(v^{n+1}_m - (1/2)*(v^n_{m+1} + v^n_{m-1})) ...
    %     + (1/(2*h))*f'(v^n_m)*(v^n_{m+1} - v^n_{m-1}) = 0
    M = length(v) - 1;
    v = (1/2)*(v([2:M 1:2]) + v([M 1:M])) ...
      - (k/(2*h)).*v.*(v([2:M 1:2]) - v([M 1:M]));
endfunction
