function x = solve_tridiag(a, b, c, d, x0, xnp1)
    % a(i) * x(i-1) + b(i) * x(i) + c(i) * x(i+1) = d(i)
    if nargin() <= 4
        x0 = 0;
        if nargin() <= 5
            xnp1 = 0;
        endif
    endif
    n = length(d);
    c(1) /= b(1);
    d(1) = (d(1) - a(1) * x0) / b(1);
    d(n) -= c(n) * xnp1;
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
