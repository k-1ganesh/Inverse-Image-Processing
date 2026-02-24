k_values = [5 50 200];

for idx = 1:3
    k_val = k_values(idx);
    
    ki = find(k_list == k_val);
    
    figure;
   % plot(m_list, RMSE_OMP(ki, :), '-o', 'LineWidth', 2);
    plot(m_list,RMSE_COSAMP(ki,:),'-o', 'LineWidth', 2);
    grid on;
    
    xlabel('Number of measurements m');
    ylabel('Normalized RMSE');
   % title(sprintf('RMSE vs m for k = %d using OMP', k_val));
    title(sprintf('RMSE vs m for k = %d using COSAMP', k_val));
end
