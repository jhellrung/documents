function v = lax_friedrichs(v, a, k, h)
    % (1/k)*(v^{n+1}_m - (1/2)*(v^n_{m+1} + v^n_{m-1})) ...
    %     + (a/(2*h))*(v^n_{m+1} - v^n_{m-1}) = 0
    v = ((1 - a*k/h)/2)*[v(2:end) v(2)] ...
      + ((1 + a*k/h)/2)*[v(end-1) v(1:end-1)];
endfunction
