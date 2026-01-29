idxs = [1,3600,9000,14400,18000,3601,3602,3603];
ESHO = 0.5:1:Ns-0.5;
PSHO = zeros(Ns,8);
EE = valRe;
PE = zeros(Ne,8);
for idx=1:8
    v = e(:,idxs(idx));
    % p is rho_s
    p = zeros(Ns,Ns);
    for n=0:Ns-1
        for m=0:Ns-1
            p(n+1,m+1)=v(n*Ne+1:(n+1)*Ne)'*v(m*Ne+1:(m+1)*Ne);
        end
    end
    PSHO(:,idx)=diag(p);
    for n=0:Ns-1
        v(n*Ne+1:(n+1)*Ne)=vRe'*v(n*Ne+1:(n+1)*Ne);
    end
    % p is rho_e at eigenbasis
    p = zeros(Ne,Ne);
    for i=1:Ne
        for j=1:Ne
            p(i,j)=v(i:Ne:(Ns-1)*Ne+i)'*v(j:Ne:(Ns-1)*Ne+j);
        end
    end
    PE(:,idx)=diag(p);
end

for i=1:8
    fig = figure;
    plot(ESHO,PSHO(:,i),'Color','blue','LineWidth',1);
    xlabel('E_s','FontSize',10);
    ylabel('P_s(E)','FontSize',10);
    title("i="+idxs(i)+",E_w="+val(idxs(i)),'FontSize',10);
    set(fig, 'Position', [100, 100, 800, 150]);
end
Ed = -14.75:0.5:14.75;
Pd = zeros(60,8);
for idx=1:8
    for j=1:Ne
        c = floor((EE(j)+15)*2)+1;
        Pd(c,idx)=Pd(c,idx)+PE(j,idx);
    end
end
for i=1:8
    fig = figure;
    plot(Ed,Pd(:,i),'Color','red','LineWidth',1);
    xlabel('E_e','FontSize',10);
    ylabel('P_e(E)','FontSize',10);
    title("i="+idxs(i)+",E_w="+val(idxs(i)),'FontSize',10);
    set(fig, 'Position', [100, 100, 800, 150]);
end