m_values = [500 700];

for ki = 1:length(k_list)
    k_val = k_list(ki);

    mi1 = find(m_list == 500);
    mi2 = find(m_list == 700);

    figure;

    subplot(1,3,1);
    imshow(f_originals{ki}, []);
    title(sprintf('Original (k = %d)', k_val));

    subplot(1,3,2);
    %imshow(f_reconstructed{ki, mi1}, []);
    imshow(f_reconstructed_cosamp{ki, mi1}, []);
    title('Reconstruction (m = 500)');

    subplot(1,3,3);
    %imshow(f_reconstructed{ki, mi2}, []);
    imshow(f_reconstructed_cosamp{ki, mi2}, []);
    title('Reconstruction (m = 700)');

    %sgtitle(sprintf('OMP Reconstructions for k = %d', k_val));
    sgtitle(sprintf('COSAMP Reconstructions for k = %d', k_val));

    %filename = sprintf('OMP_Images/OMP_k_%d_m_500_700.png', k_val);
    filename = sprintf('COSAMP_Images/COSAMP_k_%d_m_500_700.png', k_val);
    exportgraphics(gcf, filename, 'Resolution', 300);

    close(gcf);
end
