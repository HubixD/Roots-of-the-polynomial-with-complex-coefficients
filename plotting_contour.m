function  plotting_contour(x,y,fz,z0)
    v =[0,0.00001];
    
    figure(1); clf;
        contour(x,y,real(fz),v,'r'); hold on; grid on;                          %root finder
        contour(x,y,imag(fz),v,'b');
        plot(real(z0),imag(z0),'k.','Markersize',18); 
        legend('Real','Imaginary','Roots');
        title('Roots');
        xlabel('Re');ylabel('Im');
end