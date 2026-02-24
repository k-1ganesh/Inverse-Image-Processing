x = imread('barbara256.png');
x = double(x);

sigma = 2; 
noise = sigma * randn(size(x));

y = x + noise;
y = min(max(y,0),255);

figure;
subplot(1,2,1);
imshow(uint8(x)); title('Original');
subplot(1,2,2);
imshow(uint8(y)); title('Noisy');
