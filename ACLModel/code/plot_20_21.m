t = 1000000;
ESHO = 0.5:1:Ns-0.5;
PSHO = zeros(Ns,5);
EE = valRe;
PE = zeros(Ne,5);
beta0 = zeros(Ne*Ns,11);
beta0(:,1:5)=betaS;
beta0(11931,6)=1;
beta0(11932,7)=1;
beta0(11933,8)=1;
beta0(14265,9)=1;
beta0(14266,10)=1;
beta0(14267,11)=1;
for idx=1:11
    betat = beta0(:,idx);
    for j=1:Ne*Ns
        betat(j) = betat(j) * exp(-1i*val(j)*t);
    end
    v = e*betat;
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

fig = figure;
hold on;
plot(ESHO,PSHO(:,1),':','Color','blue','LineWidth',1);
plot(ESHO,PSHO(:,2),'--','Color','blue','LineWidth',1);
plot(ESHO,PSHO(:,3),'-.','Color','blue','LineWidth',1);
plot(ESHO,PSHO(:,4),'+','Color','blue','LineWidth',1);
plot(ESHO,PSHO(:,5),'Color','blue','LineWidth',1);
plot(ESHO,PSHO(:,6),'Color','magenta','LineWidth',0.5);
plot(ESHO,PSHO(:,7),'Color','magenta','LineWidth',0.5);
plot(ESHO,PSHO(:,8),'Color','magenta','LineWidth',0.5);
plot(ESHO,PSHO(:,9),'Color','green','LineWidth',0.5);
plot(ESHO,PSHO(:,10),'Color','green','LineWidth',0.5);
plot(ESHO,PSHO(:,11),'Color','green','LineWidth',0.5);
xlabel('E_s','FontSize',10);
ylabel('P_s(E)','FontSize',10);
title("t=10^6, E_I=0.1",'FontSize',10);
set(fig, 'Position', [100, 100, 800, 200]);    

Ed = -14.75:0.5:14.75;
Pd = zeros(60,11);
for idx=1:11
    for j=1:Ne
        c = floor((EE(j)+15)*2)+1;
        Pd(c,idx)=Pd(c,idx)+PE(j,idx);
    end
end
fig = figure;
hold on;
title("t=10^6, E_I=0.1",'FontSize',10);
set(fig, 'Position', [100, 100, 800, 200]);   
plot(Ed,Pd(:,1),':','Color','red','LineWidth',1);
plot(Ed,Pd(:,2),'--','Color','red','LineWidth',1);
plot(Ed,Pd(:,3),'-.','Color','red','LineWidth',1);
plot(Ed,Pd(:,4),'+','Color','red','LineWidth',1);
plot(Ed,Pd(:,5),'Color','red','LineWidth',1);
plot(Ed,Pd(:,6),'Color','magenta','LineWidth',0.5);
plot(Ed,Pd(:,7),'Color','magenta','LineWidth',0.5);
plot(Ed,Pd(:,8),'Color','magenta','LineWidth',0.5);
plot(Ed,Pd(:,9),'Color','green','LineWidth',0.5);
plot(Ed,Pd(:,10),'Color','green','LineWidth',0.5);
plot(Ed,Pd(:,11),'Color','green','LineWidth',0.5);
xlabel('E_e','FontSize',10);
ylabel('P_e(E)','FontSize',10);
hold off;

PW = zeros(Ne*Ns,5);
for idx=1:5
    beta = betaS(:,idx);
    PW(:,idx)= conj(beta).*beta;
end

fig = figure;
hold on;
% plot(val,PW(:,1),':','Color','blue','LineWidth',1);
% plot(val,PW(:,2),'--','Color','blue','LineWidth',1);
% plot(val,PW(:,3),'-.','Color','blue','LineWidth',1);
% plot(val,PW(:,4),'+','Color','blue','LineWidth',1);
% plot(val,PW(:,5),'Color','blue','LineWidth',1);
% xlabel('E_w','FontSize',10);
% ylabel('P_w(E)','FontSize',10);
title("E_I="+num2str(EI),'FontSize',10);
set(fig, 'Position', [100, 100, 800, 200]);    
Ed = -14.9:0.2:44.9;
Pd = zeros(300,5);
for idx=1:5
    for j=1:Ne*Ns
        c = floor((val(j)+15)*5)+1;
        Pd(c,idx)=Pd(c,idx)+PW(j,idx);
    end
end
plot(Ed,Pd(:,1),':','Color','blue','LineWidth',0.5);
plot(Ed,Pd(:,2),'--','Color','blue','LineWidth',0.5);
plot(Ed,Pd(:,3),'-.','Color','blue','LineWidth',0.5);
plot(Ed,Pd(:,4),'+','Color','blue','LineWidth',0.5);
plot(Ed,Pd(:,5),'Color','blue','LineWidth',0.5);
plot(repelem(val(11931),2),[0,0.03],'Color','magenta','LineWidth',0.5);
plot(repelem(val(11932),2),[0,0.03],'Color','magenta','LineWidth',0.5);
plot(repelem(val(11933),2),[0,0.03],'Color','magenta','LineWidth',0.5);
plot(repelem(val(14265),2),[0,0.03],'Color','green','LineWidth',0.5);
plot(repelem(val(14266),2),[0,0.03],'Color','green','LineWidth',0.5);
plot(repelem(val(14267),2),[0,0.03],'Color','green','LineWidth',0.5);
xlabel('E_w','FontSize',10);
ylabel('P_w(E)','FontSize',10);
ylim([0,inf]);
hold off;
