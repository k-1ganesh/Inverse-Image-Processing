function [f, theta] = generate_image(N, k)
    n = N*N;

    theta = zeros(n,1); % DCT coefficient vector.
    idx = randperm(n, k);
    theta(idx) = randn(k,1); % k sparse DCT coefficient vector.

    C = reshape(theta, N, N); 
    f = idct2(C); % This is true image considering it is exactly k sparse.
end
