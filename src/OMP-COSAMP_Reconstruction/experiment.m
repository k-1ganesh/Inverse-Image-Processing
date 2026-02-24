N = 32;
n = N*N;
k_list = [5 10 20 30 50 100 150 200];
m_list = [100 200 300 400 500 600 700 800 900 1000]; 
RMSE_OMP = zeros(length(k_list), length(m_list));  %This is to store RMSE values for OMP.
RMSE_COSAMP = zeros(length(k_list), length(m_list)) ; %This is to store RMSE values for COSAMP.
f_originals = cell(length(k_list),1);  % This is to store the original images for different k.
f_reconstructed = cell(length(k_list),length(m_list));  % this is to store reconstructed images using omp.
f_reconstructed_cosamp = cell(length(k_list),length(m_list)); % this is to store reconstructed images using cosamp. 

for ki = 1:length(k_list)
    k = k_list(ki);

    [f, theta_true] = generate_image(N, k);
    f_originals{ki} = f;  
    x = f(:);   
    
    for mi = 1:length(m_list)
        m = m_list(mi);

        Phi = sign(randn(m, n));

        y = Phi * x;

        A = zeros(m, n);
        for j = 1:n % We will compute A column by column.
            e = zeros(n,1);
            e(j) = 1;
            basis_img = idct2(reshape(e, N, N));
            A(:,j) = Phi * basis_img(:);
        end

        theta_hat = omp(y, A, k); % Best theta using omp
        theta_hat2 = COSAMP(y , A , k); % Best theta using cosamp.

        C_hat = reshape(theta_hat, N, N);
        f_hat = idct2(C_hat); % reconstruction using omp.
        f_reconstructed{ki, mi} = f_hat;

        C_hat2 = reshape(theta_hat2, N, N);
        f_hat2 = idct2(C_hat2); %reconstruction using cosamp.
        f_reconstructed_cosamp{ki, mi} = f_hat2;

        RMSE_OMP(ki, mi) = norm(f(:) - f_hat(:)) / norm(f(:));
        RMSE_COSAMP(ki, mi) = norm(f(:) - f_hat2(:)) / norm(f(:));
    end
end

