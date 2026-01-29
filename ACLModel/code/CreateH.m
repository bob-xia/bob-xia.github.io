Ns = 30;
Ne = 600;

Ee = 1;
EI = 1;

H = zeros(Ns*Ne,Ns*Ne);
for n=0:Ns-1
    for i=1:Ne
        x = n*Ne+i;
        H(x,x) = H(x,x) + n + 1/2;
        for j=1:Ne
            y = n*Ne+j;
            H(x,y) = H(x,y) + Ee*Re(i,j);
            if n~=Ns-1
                H(x,y+Ne) = H(x,y+Ne) + EI*sqrt((n+1)/2)*RI(i,j);
            end
            if n~=0
                H(x,y-Ne) = H(x,y-Ne) + EI*sqrt(n/2)*RI(i,j);
            end
        end
    end
end
[e,v]=eig(H);
val=diag(v);