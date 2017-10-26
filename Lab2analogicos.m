datos = csvread('Distorsion.csv');

F = 40000;
T0 = 1/F;
S = 200; 

Ts = T0/S;
Fs = 1/Ts;


T = datos(:,1)*Ts;
V = datos(:,2);

L = length(T);

X = fft(V,length(T));

P2 = abs(X/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure(1)
plot(T,V)


figure(2)
plot(f,log(P1))