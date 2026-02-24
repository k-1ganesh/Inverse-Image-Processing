% Loading Barbara Image. 
%X_clean = imread('barbara256.png'); 
%X_clean = double(X_clean);

%Loading Goldhill Image. 
X_clean = imread('goldhill.png'); 
X_clean = X_clean(1:256,1:256); 
X_clean = double(X_clean);

%Adding Noise to Image 
sigma = 2; 
noise = sigma * randn(size(X_clean));
X = X_clean + noise;
X = min(max(X,0),255);

[M,N] = size(X);

U = kron(dctmtx(8)', dctmtx(8)'); 
Phi = randn(32,64) / sqrt(64); 
A = Phi * U;


lambda = 1;
alpha = max(eig(A'*A)) + 1e-6; 
alpha = 1 / alpha;

max_iter = 50; % 50 for CCD and 1500 for ISTA

X_reconstructed = zeros(M,N);
count = zeros(M,N); % We want to keep count of how many times each pixel is reconstructed. 

for i = 1:M-7
    for j = 1:N-7
        
        patch = X(i:i+7, j:j+7);
        xi = patch(:);
        
        % compressed measurement. 
        yi = Phi * xi;
        
        %theta_hat = ISTA(A, yi, lambda, alpha, max_iter);
        theta_hat = CyclicCoordinateDescent(A, yi, lambda,max_iter);
        
        
        % Recovered Patch.
        xi_hat = U * theta_hat;
        patch_hat = reshape(xi_hat,8,8);
        
        % Now aggregate overlapping patches
        X_reconstructed(i:i+7, j:j+7) = X_reconstructed(i:i+7, j:j+7) + patch_hat;
        count(i:i+7, j:j+7) = count(i:i+7, j:j+7) + 1;
    end
end

% Now average overlapping patches
X_reconstructed = X_reconstructed ./ count;


rmse = norm(X_clean(:) - X_reconstructed(:)) / norm(X_clean(:));
rmse_str = sprintf('%.4f', rmse);

figure;
subplot(1,3,1);
imshow(uint8(X_clean));
title('Original');

subplot(1,3,2);
imshow(uint8(X));
title('Noisy');

subplot(1,3,3);
imshow(uint8(X_reconstructed));
%title('Reconstructed (ISTA)');
title('Reconstructed (CCD)');

%sgtitle(['RMSE (ISTA)  = ', rmse_str], 'FontSize', 14, 'FontWeight', 'bold');
sgtitle(['RMSE (CCD)  = ', rmse_str], 'FontSize', 14, 'FontWeight', 'bold');

