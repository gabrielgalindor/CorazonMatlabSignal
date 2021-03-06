clc
close all
clear all
a=textread('Signalecg.txt');
t=a(:,1);
x=a(:,2);
y=a(:,3);
figure
xlabel('Tiempo(Seg)')
ylabel('amplitud(mv)')
plot(t,x)
Ts=t(2)-t(1);
Fs=1/Ts;
L=40;
Fl=[1 10 20 30 40];
Fh=[10 20 30 40 50];
p=length(Fl);
for i=1:p
    f1=Fl(i);
    f2=Fh(i);
    B=pasabanda(Fs,f1,f2,L);
    figure
    freqz(B,1,200,Fs)
    N=length(x); %limite del arreglo 
    for n=1+L:N
        c=0;
        for k=1:L
            c=c+B(k)*x(n-k);
        end
        y(n)=c;
    end 
    xm(:,i)=y;
end
figure
for i=1:p
    subplot(p,1,i)
    plot(xm(:,i))
end
x3=xm(:,4);
L1=2;
b1=[1 -1]; 

for n=1+L1:N
        c=0;
        for k=1:L1
            c=c+B(k)*x(n-k);
        end
        y(n)=c;
    end 
    x3=y;
    figure
    plot(x3)
    