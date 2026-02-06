k_values = [5 50 200];

for idx = 1:3
    k_val = k_values(idx);
    ki = find(k_list == k_val);

    for mi = 1:length(m_list)
        m_val = m_list(mi);

        figure;

        subplot(1,2,1);
        imshow(f_originals{ki}, []);
        title(sprintf('Original (k = %d)', k_val));

        subplot(1,2,2);
        %imshow(f_reconstructed{ki, mi}, []);
        imshow(f_reconstructed_cosamp{ki, mi}, []);
        title(sprintf('Reconstruction (m = %d)', m_val));

        %sgtitle(sprintf('OMP Reconstruction : k = %d, m = %d', k_val, m_val));
        sgtitle(sprintf('COSAMP Reconstruction : k = %d, m = %d', k_val, m_val));

        %filename = sprintf('OMP_Images/OMP_k_%d_m_%d.png', k_val, m_val);
        filename = sprintf('COSAMP_Images/COSAMP_k_%d_m_%d.png', k_val, m_val);
        exportgraphics(gcf, filename, 'Resolution', 300);

    end
end
