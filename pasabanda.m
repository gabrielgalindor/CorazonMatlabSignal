function[B]=pasabanda(Fs,Fl,Fh,L)
n=1:L;
Ts=1/Fs;
B=((sin(2*pi*Fh*Ts*(n-(L/2))))./(pi*(n-L/2)))-((sin(2*pi*Fl*Ts*(n-(L/2))))./(pi*(n-L/2)));
B(L/2)=1;