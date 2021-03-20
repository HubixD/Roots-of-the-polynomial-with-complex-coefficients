%script m-file: Project_complex_coeff.m
%
%Authors: Jakub Pasoñ, Hubert Hanusiak; 08/12/2019
%Modified: Jakub Pasoñ, Hubert Hanusiak; 

clc; clear; close all;

N = 100;                                                                      %order of a polynomial
x = -5:0.1:5;
y = -5:0.1:5;
[X,Y] = meshgrid(x,y);
z = X + Y*1i;
xplain = -5:0.5:5;                                                          %defining a plain surface
yplain = -5:0.5:5;
zplain = zeros(length(xplain));

fz_coeff = 10*rand(1,N+1)-5 + 10i*rand(1,N+1)-5i;                           %polynomial coefficients
fz = polyval(fz_coeff,z);
z0 = roots(fz_coeff)                                                        %roots of a polynomial

fz_coeff
fz_coeff_check = function_check(z,fz,z0,N)

v=[0,0.00001];                                                              %levels of the contour

plotting_contour(x,y,fz,z0);

% figure(1); clf;
%     contour(x,y,real(fz),v,'r'); hold on; grid on;                          %root finder
%     contour(x,y,imag(fz),v,'b');
%     plot(real(z0),imag(z0),'k.','Markersize',18); 
%     legend('Real','Imaginary','Roots');
%     title('Roots');
%     xlabel('Re');ylabel('Im');

    
figure(2)
    subplot(2,2,1:2);
    mesh(x,y,real(fz)); colorbar; grid on; hold on;
    mesh(xplain,yplain,zplain);
    hold off;
    xlabel('X'); ylabel('Y'); zlabel('ReZ'); title('Real part');
   
    subplot(2,2,3);
    contour(x,y,real(fz),v,'r'); hold on; grid on;                          %contour generator
    legend('Real');
    title('Contour of real part for level 0');
    
    subplot(2,2,4);
    contourf(x,y,real(fz)); grid on;
    title('Contour of real part');
      
    
figure(3)
    subplot(2,2,1:2);
    mesh(x,y,imag(fz)); colorbar; grid on; hold on;
    mesh(xplain,yplain,zplain);
    hold off;
    xlabel('X'); ylabel('Y'); zlabel('ImZ'); title('Imaginary part');
   
    subplot(2,2,3);
    contour(x,y,imag(fz),v,'b'); hold on; grid on;                          %contour generator
    legend('Imaginary');
    title('Contour of imaginary part for level 0');
    
    subplot(2,2,4);
    contourf(x,y,imag(fz)); grid on;
    title('Contour of imaginary part');
    

 figure(4)                                                                  %Prove of the fundamental theorem of algebra
    mesh(x,y,abs(fz));        
    xlabel('Re'); ylabel('Im'); zlabel('Z'); hold on; grid on;
    contour(x,y,abs(fz));
    title('Graph of absolute value of a f(z)');
    