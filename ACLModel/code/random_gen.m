Ne=600;
RI=(rand(Ne,Ne)-0.5)+1i*(rand(Ne,Ne)-0.5);
RI=(RI+RI')/2;
Re=(rand(Ne,Ne)-0.5)+1i*(rand(Ne,Ne)-0.5);
Re=(Re+Re')/2;

Ns=30;
Hs = diag((0:Ns-1)+0.5);
qs = zeros(Ns,Ns);
for n=1:Ns-1
    qs(n,n+1)=sqrt(n/2);
    qs(n+1,n)=qs(n,n+1);
end

[vRe,vR] = eig(Re);
valRe = diag(vR);