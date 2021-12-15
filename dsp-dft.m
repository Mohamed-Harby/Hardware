N = 8;
xn = ones(N, 1);

Wn = zeros(N); % N*N matrix --> twiddle fator
for k=0:N-1
    for n=0:N-1
        Wn(k+1, n+1) = exp(-1i * 2 * pi * k * n / N);
    end
end

k = 0:N-1;
Xk = Wn * xn;

subplot(2, 1, 1); %plot two figures in a single window
stem(k, abs(Xk)); % plot discrete values at K points
xlabel('K')
ylabel('|Xk|')
title('Magnitude')

subplot(2,1, 2); %plot two figures in a single window
stem(k, angle(Xk)); % plot discrete values at K points
xlabel('K')
ylabel('angle(Xk)')
title('Phase')
