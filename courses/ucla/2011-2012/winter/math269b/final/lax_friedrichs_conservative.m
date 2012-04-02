function v = lax_friedrichs_conservative(v, k, h)
    % (1/k)*(v^{n+1}_m - (1/2)*(v^n_{m+1} + v^n_{m-1})) ...
    %     + (1/(2*h))*(f(v^n_{m+1}) - f(v^n_{m-1})) = 0
    M = length(v) - 1;
    v = (1/2)*(v([2:M 1:2]) + v([M 1:M])) ...
      - (k/(4*h))*(v([2:M 1:2]).^2 - v([M 1:M]).^2);
endfunction
