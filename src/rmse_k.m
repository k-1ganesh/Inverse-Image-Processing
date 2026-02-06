m_values = [500 700];

for idx = 1:2
    m_val = m_values(idx);
    
    mi = find(m_list == m_val);
    
    figure;
   % plot(k_list, RMSE_OMP(:, mi), '-o', 'LineWidth', 2);
    plot(k_list, RMSE_COSAMP(:, mi), '-o', 'LineWidth', 2);
    grid on;
    
    xlabel('Sparsity Level k');
    ylabel('Normalized RMSE');
   % title(sprintf('RMSE vs k for m = %d using OMP', m_val));
    title(sprintf('RMSE vs k for m = %d using COSAMP', m_val));
end
