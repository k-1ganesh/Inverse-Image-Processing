function theta_hat = omp(y, A, k)
    [~, n] = size(A);

    r = y; % r is is residual vector.       
    S = []; % S to hold the index of columns.            
    theta_hat = zeros(n,1); 

    for t = 1:k
        correlations = abs(A' * r);
        [~, idx] = max(correlations); % Here we find the max correlating column. 

        S = unique([S idx]);

        As = A(:, S);
        theta_s = pinv(As) * y;

        r = y - As * theta_s; % Now update the residual . And it makes sure residual is orthogonal to As.
    end

    theta_hat(S) = theta_s; % This is the resultant best theta. 
end
