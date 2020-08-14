clear
tic
N=8;
T0=5;
a=0.1;
B=0.05;
A=((rand(N,N,N)).*(2*pi))-pi;
T1=zeros(1,65);
    for i =1:20
        T1(1,i)=T0 - a*i;
    end
    for j=21:50
        T1(1,j)= 3 - (B*(j-20));
    end
    for k =51:65
        T1(1,k)=1.5-(a*(k-50));
    end
b(1:N)=(1:N)-1;b(1)=N;
f(1:N)=(1:N)+1;f(N)=1;
d(1:N)=(1:N)+1;d(N)=1;
u(1:N)=(1:N)-1;u(1)=N;
r(1:N)=(1:N)+1;r(N)=1;
l(1:N)=(1:N)-1;l(1)=N;
num=0;
for e=1:100
    num=num+1
    for i=1:65
        T(i)=T1(i);
        for q=1:N^5
            x=floor(rand*(N))+1;
            y=floor(rand*(N))+1;
            z=floor(rand*(N))+1;
            o=(rand*(2*pi))-pi;
            H=cos((A(x,y,z))-(A(d(x),y,z)))+cos((A(x,y,z))-(A(u(x),y,z)))+cos((A(x,y,z))-(A(x,r(y),z)))+cos((A(x,y,z))-(A(x,l(y),z)))+cos((A(x,y,z))-(A(x,y,f(z))))+cos((A(x,y,z))-(A(x,y,b(z))));
            H1=cos(o-(A(d(x),y,z)))+cos(o-(A(u(x),y,z)))+cos(o-(A(x,r(y),z)))+cos((o-(A(x,l(y),z))))+cos(o-(A(x,y,f(z))))+cos(o-(A(x,y,b(z))));
            deltaH=H-H1;
            if deltaH <= 0
                A(x,y,z)=o;
            elseif exp((-(deltaH))/(T(i))) > rand
                A(x,y,z)=o;
            end
        end
        H2=0;
        for k=1:N
            for j=1:N
                for v=1:N
                H2=H2-(cos((A(k,j,v))-(A(d(k),j,v)))+cos((A(k,j,v))-(A(u(k),j,v)))+cos((A(k,j,v))-(A(k,r(j),v)))+cos((A(k,j,v))-(A(k,l(j),v)))+cos((A(k,j,v))-(A(k,j,f(v))))+cos((A(k,j,v))-(A(k,j,b(v)))))/2;
                end
            end
        end
        H3(e,i)=H2/(N^3);
        M(e,i)=(sqrt(((sum(sum(sum(cos(A)))))^2)+((sum(sum(sum(sin(A)))))^2)))/(N^3);
    end
end
toc
% w=0;s=0;
% while w < e
% w=w+1;
% if (M(w,end)) > 0.9
% s=s+1;
% mm(s,:)=M(w,:);
% ee(s,:)=H3(w,:);
% end
% end
figure
cv=(var(M))./(T.^2);plot(T,cv,'o');
xx=(var(M))./T;
figure
plot(T,mean(M));
figure
plot(T,xx)