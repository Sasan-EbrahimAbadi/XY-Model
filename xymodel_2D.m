clear
tic
N=16;
T0=2;
a=0.1;
b=0.05;
A=((rand(N)).*(2*pi))-pi;
T1=zeros(1,27);
    for i =1:5
        T1(1,i)=T0 - a*i;
    end
    for j=6:19
        T1(1,j)= 1.5 - (b*(j-6));
    end
    for k =20:27
        T1(1,k)=0.8-(a*(k-19));
    end
d(1:N)=(1:N)+1;d(N)=1;
u(1:N)=(1:N)-1;u(1)=N;
r(1:N)=(1:N)+1;r(N)=1;
l(1:N)=(1:N)-1;l(1)=N;
num=0;
for e=1:100
    num=num+1
    
    for i=1:27
        
        T(i)=T1(i);
        for q=1:(N^4)
            
        
            x=floor(rand*(N))+1;
            y=floor(rand*(N))+1;
            z=(rand*(2*pi))-pi;
            H=cos((A(x,y))-(A(d(x),y)))+cos((A(x,y))-(A(u(x),y)))+cos((A(x,y))-(A(x,r(y))))+cos((A(x,y))-(A(x,l(y))));
            H1=cos(z-(A(d(x),y)))+cos(z-(A(u(x),y)))+cos(z-(A(x,r(y))))+cos((z-(A(x,l(y)))));
            deltaH=H-H1;
            if deltaH <= 0
                A(x,y)=z;
            elseif exp((-deltaH)/T(i)) < rand
                A(x,y)=z;
            end
        end
        H2=0;
        for k=1:N
            for j=1:N
                H2=H2-(cos((A(k,j))-(A(d(k),j)))+cos((A(k,j))-(A(u(k),j)))+cos((A(k,j))-(A(k,r(j))))+cos((A(k,j))-(A(k,l(j)))))/2;
            end
            
        end
        H3(e,i)=H2/(N^2);
        M(e,i)=(sqrt(((sum(sum(cos(A))))^2)+((sum(sum(sin(A))))^2)))/(N^2);
    end
end
toc
cv=((var(H3))./(T.^2));
XX=((var(M))./T);
figure
plot(T,mean(M));axis([0 2 0 0.5])
figure
plot(T,cv);
figure
plot(T,XX)
                