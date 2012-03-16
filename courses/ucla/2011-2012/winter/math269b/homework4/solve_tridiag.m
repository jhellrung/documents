function x = solve_tridiag(a, b, c, d)
    % a(i) * x(i-1) + b(i) * x(i) + c(i) * x(i+1) = d(i)
    % a(1) = c(n) = 0
    n = length(d);
    c(1) /= b(1);
    d(1) /= b(1);
    for i = 2:n
        t = b(i) - a(i) * c(i-1);
        c(i) /= t;
        d(i) = (d(i) - a(i) * d(i-1)) / t;
    endfor
    x = zeros(size(d));
    x(n) = d(n);
    for i = n-1:-1:1
        x(i) = d(i) - c(i) * x(i+1);
    endfor
endfunction
