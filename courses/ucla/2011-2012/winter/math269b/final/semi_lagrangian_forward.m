function v = semi_lagrangian_forward(v, k, h)
    M = length(v) - 1;
    v = v ./ (1 + (k/h)*((v > 0) .* (v - v([M 1:M])) ...
                        + (v < 0) .* (v([2:M 1:2]) - v)));
endfunction
