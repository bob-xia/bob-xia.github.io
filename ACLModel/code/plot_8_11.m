beta = betaS(:,5);
T = [0,100,10000,1000000];
ESHO = 0.5:1:Ns-0.5;
PSHO = zeros(Ns,4);
% EE = valRe;
% PE = zeros(Ne,4);
for t=1:4
    betat = beta;
    for j=1:Ne*Ns
        betat(j) = beta(j) * exp(-1i*val(j)*T(t));
    end
    v = e*betat;
    % p is rho_s
    p = zeros(Ns,Ns);
    for n=0:Ns-1
        for m=0:Ns-1
            p(n+1,m+1)=v(n*Ne+1:(n+1)*Ne)'*v(m*Ne+1:(m+1)*Ne);
        end
    end
    PSHO(:,t)=diag(p);
    % for n=0:Ns-1
    %     v(n*Ne+1:(n+1)*Ne)=vRe'*v(n*Ne+1:(n+1)*Ne);
    % end
    % % p is rho_e at eigenbasis
    % p = zeros(Ne,Ne);
    % for i=1:Ne
    %     for j=1:Ne
    %         p(i,j)=v(i:Ne:(Ns-1)*Ne+i)'*v(j:Ne:(Ns-1)*Ne+j);
    %     end
    % end
    % PE(:,t)=diag(p);
end

for i=1:4
    fig = figure;
    hold on;
    % ylim([0,0.11]);
    plot(ESHO,PSHO(:,i),'Color','blue');
    xlabel('E_s','FontSize',10);
    ylabel('P_s(E)','FontSize',10);
    title("t="+num2str(T(i)),'FontSize',10);
    set(fig, 'Position', [100, 100, 800, 200]);    
    % Ed = -14.75:0.5:14.75;
    % Pd = zeros(60,1);
    % for j=1:Ne
    %     c = floor((EE(j)+15)*2)+1;
    %     Pd(c)=Pd(c)+PE(j,i);
    % end
    % plot(Ed,Pd,'Color','red');
    % xlabel('E_e','FontSize',10);
    % ylabel('P_e(E)','FontSize',10);
    hold off;
end
fig=figure;
histogram(ESHO,30);
xlabel('E_s','FontSize',10);
ylabel('N(E)','FontSize',10);
% histogram(EE,-15:0.5:15,"FaceColor",'red');
% xlabel('E_e','FontSize',10);
% ylabel('N(E)','FontSize',10);
set(fig, 'Position', [100, 100, 800, 200]);


% t = 1000000;
% % ESHO = 0.5:1:Ns-0.5;
% % PSHO = zeros(Ns,5);
% EE = valRe;
% PE = zeros(Ne,5);
% for idx=1:5
%     betat = betaS(:,idx);
%     for j=1:Ne*Ns
%         betat(j) = betat(j) * exp(-1i*val(j)*t);
%     end
%     v = e*betat;
%     % % p is rho_s
%     % p = zeros(Ns,Ns);
%     % for n=0:Ns-1
%     %     for m=0:Ns-1
%     %         p(n+1,m+1)=v(n*Ne+1:(n+1)*Ne)'*v(m*Ne+1:(m+1)*Ne);
%     %     end
%     % end
%     % PSHO(:,idx)=diag(p);
%     for n=0:Ns-1
%         v(n*Ne+1:(n+1)*Ne)=vRe'*v(n*Ne+1:(n+1)*Ne);
%     end
%     % p is rho_e at eigenbasis
%     p = zeros(Ne,Ne);
%     for i=1:Ne
%         for j=1:Ne
%             p(i,j)=v(i:Ne:(Ns-1)*Ne+i)'*v(j:Ne:(Ns-1)*Ne+j);
%         end
%     end
%     PE(:,idx)=diag(p);
% end
% 
% fig = figure;
% hold on;
% % plot(ESHO,PSHO(:,1),':','Color','blue','LineWidth',1);
% % plot(ESHO,PSHO(:,2),'--','Color','blue','LineWidth',1);
% % plot(ESHO,PSHO(:,3),'-.','Color','blue','LineWidth',1);
% % plot(ESHO,PSHO(:,4),'+','Color','blue','LineWidth',1);
% % plot(ESHO,PSHO(:,5),'Color','blue','LineWidth',1);
% % xlabel('E_s','FontSize',10);
% % ylabel('P_s(E)','FontSize',10);
% title("t=10^6, E_I=0.1",'FontSize',10);
% set(fig, 'Position', [100, 100, 800, 200]);    
% Ed = -14.75:0.5:14.75;
% Pd = zeros(60,5);
% for idx=1:5
%     for j=1:Ne
%         c = floor((EE(j)+15)*2)+1;
%         Pd(c,idx)=Pd(c,idx)+PE(j,idx);
%     end
% end
% plot(Ed,Pd(:,1),':','Color','red','LineWidth',1);
% plot(Ed,Pd(:,2),'--','Color','red','LineWidth',1);
% plot(Ed,Pd(:,3),'-.','Color','red','LineWidth',1);
% plot(Ed,Pd(:,4),'+','Color','red','LineWidth',1);
% plot(Ed,Pd(:,5),'Color','red','LineWidth',1);
% xlabel('E_e','FontSize',10);
% ylabel('P_e(E)','FontSize',10);
% hold off;