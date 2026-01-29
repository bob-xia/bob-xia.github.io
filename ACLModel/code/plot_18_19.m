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
xlabel('E_w','FontSize',10);
ylabel('P_w(E)','FontSize',10);
xlim([23,24]);
ylim([0,inf]);
hold off;


fig=figure;
histogram(val,-15:0.2:45,"FaceColor",'blue');
title("E_I="+num2str(EI),'FontSize',10);
xlabel('E_w','FontSize',10);
ylabel('N(E)','FontSize',10);
set(fig, 'Position', [100, 100, 800, 200]);