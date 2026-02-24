function theta = ISTA(A, y, lambda, alpha, max_iter)

theta = zeros(size(A,2),1);

for k = 1:max_iter
    
    grad = A' * (y - A*theta);
    
    theta = soft_threshold(theta + alpha*grad, lambda*alpha);
    
end

end


% We need to do soft_threshold to enforce sparsity. 
function z = soft_threshold(x, T)

z = sign(x) .* max(abs(x) - T, 0);

end