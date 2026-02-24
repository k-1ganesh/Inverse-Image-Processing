function theta = CyclicCoordinateDescent(A, y, lambda, max_iter)

[~, n] = size(A);

theta = zeros(n,1);

column_norms = sum(A.^2, 1); 

for iter = 1:max_iter
    
    for j = 1:n
        
        if column_norms(j) == 0
            continue;
        end
        
        r = y - A*theta + A(:,j)*theta(j); % Here we compute partial residual.
        
        theta(j) = soft_threshold( A(:,j)' * r / column_norms(j), lambda / column_norms(j));
        
    end
    
end

end


function z = soft_threshold(x, T)
    z = sign(x) .* max(abs(x) - T, 0);
end