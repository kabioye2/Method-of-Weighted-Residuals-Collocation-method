clc
clear all
close all
%Problem 1
x0 = 0;
x1 = .25;
x2 = .75;
x3 = 1;
phi = 2;
%L(x)
x=x0;
L0x0 = ((x^3)-(2*(x^2))+(1.1875*x)-0.1875)/(-0.1875);
L1x0 = ((x^3)-(1.75*(x^2))+(0.75*x))/0.09375;
L2x0 = ((x^3)-(1.25*(x^2))+(0.25*x))/(-0.09375);
L3x0 = ((x^3)-(x^2)+(0.1875*x))/0.1875;
x=x1;
L0x1 = ((x^3)-(2*(x^2))+(1.1875*x)-0.1875)/(-0.1875);
L1x1 = ((x^3)-(1.75*(x^2))+(0.75*x))/0.09375;
L2x1 = ((x^3)-(1.25*(x^2))+(0.25*x))/(-0.09375);
L3x1 = ((x^3)-(x^2)+(0.1875*x))/0.1875;
x=x2;
L0x2 = ((x^3)-(2*(x^2))+(1.1875*x)-0.1875)/(-0.1875);
L1x2 = ((x^3)-(1.75*(x^2))+(0.75*x))/0.09375;
L2x2 = ((x^3)-(1.25*(x^2))+(0.25*x))/(-0.09375);
L3x2 = ((x^3)-(x^2)+(0.1875*x))/0.1875;
x=x3;
L0x3 = ((x^3)-(2*(x^2))+(1.1875*x)-0.1875)/(-0.1875);
L1x3 = ((x^3)-(1.75*(x^2))+(0.75*x))/0.09375;
L2x3 = ((x^3)-(1.25*(x^2))+(0.25*x))/(-0.09375);
L3x3 = ((x^3)-(x^2)+(0.1875*x))/0.1875;
%L(x) derivative
x=x0;
L0Dx0 = ((3*(x^2))-(4*x)+1.1875)/(-0.1875);
L1Dx0 = ((3*(x^2))-(3.5*x)+0.75)/0.09375;
L2Dx0 = ((3*(x^2))-(2.5*x)+0.25)/(-0.09375);
L3Dx0 = ((3*(x^2))-(2*x)+0.1875)/0.1875;
x=x1;
L0Dx1 = ((3*(x^2))-(4*x)+1.1875)/(-0.1875);
L1Dx1 = ((3*(x^2))-(3.5*x)+0.75)/0.09375;
L2Dx1 = ((3*(x^2))-(2.5*x)+0.25)/(-0.09375);
L3Dx1 = ((3*(x^2))-(2*x)+0.1875)/0.1875;
x=x2;
L0Dx2 = ((3*(x^2))-(4*x)+1.1875)/(-0.1875);
L1Dx2 = ((3*(x^2))-(3.5*x)+0.75)/0.09375;
L2Dx2 = ((3*(x^2))-(2.5*x)+0.25)/(-0.09375);
L3Dx2 = ((3*(x^2))-(2*x)+0.1875)/0.1875;
x=x3;
L0Dx3 = ((3*(x^2))-(4*x)+1.1875)/(-0.1875);
L1Dx3 = ((3*(x^2))-(3.5*x)+0.75)/0.09375;
L2Dx3 = ((3*(x^2))-(2.5*x)+0.25)/(-0.09375);
L3Dx3 = ((3*(x^2))-(2*x)+0.1875)/0.1875;
%L(x) Double Derivative
x=x0;
L0DDx0 = ((6*x)-4)/(-0.1875);
L1DDx0 = ((6*x)-3.5)/(0.09375);
L2DDx0 = ((6*x)-2.5)/(-0.09375);
L3DDx0 = ((6*x)-2)/0.1875;
x=x1;
L0DDx1 = ((6*x)-4)/(-0.1875);
L1DDx1 = ((6*x)-3.5)/(0.09375);
L2DDx1 = ((6*x)-2.5)/(-0.09375);
L3DDx1 = ((6*x)-2)/0.1875;
x=x2;
L0DDx2 = ((6*x)-4)/(-0.1875);
L1DDx2 = ((6*x)-3.5)/(0.09375);
L2DDx2 = ((6*x)-2.5)/(-0.09375);
L3DDx2 = ((6*x)-2)/0.1875;
x=x3;
L0DDx3 = ((6*x)-4)/(-0.1875);
L1DDx3 = ((6*x)-3.5)/(0.09375);
L2DDx3 = ((6*x)-2.5)/(-0.09375);
L3DDx3 = ((6*x)-2)/0.1875;
%at x1
c0x1 = L0DDx1 + ((1/x1)*L0Dx1);
c1x1 = L1DDx1 + ((1/x1)*L1Dx1)-((phi^2)*L1x1);
c2x1 = L2DDx1 + ((1/x1)*L2Dx1);
c3x1 = L3DDx1 + ((1/x1)*L3Dx1);
%at x2
c0x2 = L0DDx2 + ((1/x2)*L0Dx2);
c1x2 = L1DDx2 + ((1/x2)*L1Dx2);
c2x2 = L2DDx2 + ((1/x2)*L2Dx2)-((phi^2)*L2x2);
c3x2 = L3DDx2 + ((1/x2)*L3Dx2);
C0 = [L0Dx0 L1Dx0 L2Dx0 L3Dx0];
C1 = [c0x1 c1x1 c2x1 c3x1];
C2 = [c0x2 c1x2 c2x2 c3x2];
C3 = [0 0 0 1];
A = [C0;C1;C2;C3];
b = [0;0;0;1];
conc = A\b;
%Problem 2
int = [0;0.25;0.75;1];
scatter(int,conc)
hold on
plot(int,conc)
title('Concentration Profile');
xlabel('Node')
ylabel('Concentration')
%Problem 3
r = A*conc-b;
figure
plot(int,r)
hold on
scatter(int,r)
title('Residual Error')
xlabel('Node')
ylabel('Residual')
%Problem 4
int = (0:0.01:1).';
CAnalytical = besseli(0,phi*int)/besseli(0,phi);
figure;
plot(int,CAnalytical,'linewidth',1.5)
xlabel('r')
ylabel('c(r)')
set(gca,'fontsize',12)
