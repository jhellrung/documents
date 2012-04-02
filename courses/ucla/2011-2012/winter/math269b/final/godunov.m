function v = gudonov(v, k, h)
    % (1/k)*(v^{n+1}_m - v^n_m) ...
    %     + (1/h)*(f(u^*(v^n_m,v^n_{m+1})) - f(u^*(v^n_{m-1},v^n_m))) = 0
    M = length(v) - 1;
    v = v - (k/(2*h))*(vstar(v,v([2:M 1:2])).^2 - vstar(v([M 1:M]),v).^2);
endfunction

function v = vstar(vL, vR)
    v = (vL >= 0 & vL + vR > 0) .* vL ...
      + (vR <= 0 & vL + vR < 0) .* vR;
endfunction
