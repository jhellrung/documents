function w = solve_periodic_tridiag(a, b, c, d)
    % a(i) * x(i-1) + b(i) * x(i) + c(i) * x(i+1) = d(i)
    % x(0) = x(n), x(n+1) = x(1)
    n = length(d);
    x = solve_tridiag(a, b, c, d, 0, 0);
    y = solve_tridiag(a, b, c, zeros(size(d)), 1, 0);
    z = solve_tridiag(a, b, c, zeros(size(d)), 0, 1);
    D = (1 - y(n))*(1 - z(1)) - y(1)*z(n);
    r = (x(n)*(1 - z(1)) + x(1)*z(n))/D;
    s = (x(n)*y(1) + x(1)*(1 - y(n)))/D;
    w = x + r*y + s*z;
endfunction
