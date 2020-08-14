clear
tic
N=50;
K=3;
beta=0.02;
T0=10;
a=0.1;
b=0.05;
A=((rand(1,N))*(2*pi))-pi;
h = WattsStrogatz(N,K,beta);
l=full(adjacency(h));
T1=zeros(1,120);
for i =1:40
    T1(1,i)=T0 - a*i;
end
for j=41:80
    T1(1,j)= 6 - (b*(j-40));
end
for k =81:120
    T1(1,k)=4-(a*(k-80));
end
num=0;
for e=1:100
    num=num+1 
    for i=1:120
      T(i)=T1(i);
        for q=1:50*(N^2) 
            x=(floor(rand*N))+1;
            y=(rand*(2*pi))-pi;
            w=0;
            H=0;
            H1=0;
            while w < N
                w=w+1;
                if l(x,w)==1 & x~=w
                    H=H+cos(A(1,x)-A(1,w));
                    H1=H1+cos(y-A(1,w));
                end
            end
            deltaH=H-H1;
            if deltaH <= 0
                A(1,x)=y;
            elseif exp((-deltaH)/T(i)) > rand
                A(1,x)=y;
            end
        end
        H3=0;
        for j=1:N
            w1=0;
            H2=0;
            while w1 < N
                w1=w1+1;
                if l(j,w1)==1 & j~=w1
                    H2=H2+cos(A(1,j)-A(1,w1));
                end
            end
            H3=H3-H2;
        end
        H4(e,i)=H3/N;
        M(e,i)=(sqrt(((sum(cos(A)))^2)+((sum(sin(A)))^2)))/N;
    end
end
% w3=0;s=0;
% while w3 < e
% w3=w3+1;
% if abs(M(w3,end)) > 0.7
% s=s+1;
% mm1(s,:)=M(w3,:);
% ee1(s,:)=H4(w3,:);
% end
% end
toc   
figure
plot(T,mean(M));
cv=(var(M))./(T.^2);
figure
plot(T,cv);
x=var(M)./T;
figure
plot(T,x)