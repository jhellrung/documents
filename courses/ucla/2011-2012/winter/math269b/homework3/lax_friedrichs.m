function v = lax_friedrichs(v, a, k, h)
    % (1/k)*(v^{n+1}_m - (1/2)*(v^n_{m+1} + v^n_{m-1})) ...
    %     + (a/(2*h))*(v^n_{m+1} - v^n_{m-1}) = 0
    M = length(v) - 1;
    v = ((1 - a*k/h)/2)*v([2:M 1:2]) ...
      + ((1 + a*k/h)/2)*v([M 1:M]);
endfunction
