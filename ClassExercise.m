n=0:255;
x=4*sin(4*pi*n/256);
plot(n,x,'r')
xlabel('n')
ylabel('Magnitude')
v=0.1*randn(1,256);
y=x+v;
hold on;
plot(n,y,'b')
legend('x','y')
title('Q1')
MSE1=mean((y-x).*(y-x));


f=fft(y);
w=(0:255)*2*pi/256;
figure; plot(w,abs(f))
xlabel('w (rad/sec)')
ylabel('Magnitude')
title ('Q2 -FFT')
% Signal component is much higher compared to the noise
% Use a threshold to make magnitudes lower
% than the threshold to zero
f1=f;
f1(abs(f1)<100)=0;
x1=ifft(f1);
figure;plot(n,y,'b', n, x1, 'g')
xlabel('n');
ylabel('Magnitude');
title ('Q2')
legend('y','x1')
MSE1=mean((x1-x).*(x1-x));

% y(n)=(x(n-1)+x(n)+x(n+1))/3
% ignore the two points at the boundaries
% filter the rest using the above equation
x2=y;
for i=2:255
x2(i)=(y(i-1)+y(i)+y(i+1))/3;
end
MSE2=mean((x2-x).*(x2-x));
figure;plot(n,y,'b', n, x2, 'g')
xlabel('n');
ylabel('Magnitude');
title ('Q3')
legend('y','x2')

x3=y;
for i=2:255
x3(i)=(x2(i-1)+x2(i)+x2(i+1))/3;
end;
MSE3=mean((x3-x).*(x3-x))
figure;plot(n,y,'b', n, x3, 'g')
xlabel('n');
ylabel('Magnitude');
title ('Q4')
legend('y','x3')


subplot(2,2,1);plot(n,x,'r')
xlabel('n');
ylabel('Magnitude');
title ('x')
title ('x(n)')
subplot(2,2,2);plot(n,x1,'b');
ylabel('Magnitude');
xlabel('n');
title ('x1(n)')
subplot(2,2,3);plot(n,x2,'b');
ylabel('Magnitude');
xlabel('n');
title ('x2(n)')
subplot(2,2,4);plot(n,x3,'b');
ylabel('Magnitude');
xlabel('n');
title ('x3(n)')
