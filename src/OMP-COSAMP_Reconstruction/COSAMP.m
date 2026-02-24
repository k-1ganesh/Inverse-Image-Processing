function theta_hat = COSAMP(y, A, k)

    [~, n] = size(A);

    r = y;                 
    S = [];                
    theta_hat = zeros(n,1);

    max_iteration = 10;

    for t = 1:max_iteration

        correlation = abs(A' * r); % To find the most correlating column.

        [~, idx] = sort(correlation, 'descend');
        Omega = idx(1:min(2*k, n)); % This now has index of top 2k correlating columns.

        T = union(S, Omega);

        AT = A(:, T);
        theta_T = pinv(AT) * y; % This finds the contribution of 2k columns to approximate y.

        
        [~, idx2] = sort(abs(theta_T), 'descend');
        S = T(idx2(1:min(k, length(idx2)))); % S contains the index of top k contributing columns. 

        AS = A(:, S);
        theta_s = pinv(AS) * y;

        r = y - AS * theta_s;

    end
    theta_hat(S) = theta_s; % Do the final update now. 
end
