% decompose the initial states to eigenvectors, \sum beta_i \ket{E_i} = \ket{psi(t=0)}
% then beta_i = E^\dagger \psi(t=0)

count = 100;
l = -2;
r = 6;
tspan = power(10,l:(r-l)/count:r);
Hst = zeros(count+1,5);
HIt = Hst;
Het = Hst;
S = Hst;

% p = parpool(15);

for idx=1:5

beta = betaS(:,idx);
% beta = betaS(:,5);

for t=1:count+1
    betat = beta;
    for j=1:Ne*Ns
        betat(j) = beta(j) * exp(-1i*val(j)*tspan(t));
    end
    v = e*betat;
    % not enough memory for Hs, He, HI
    EHs = 0; EHe = 0; EHI = 0;
    parfor n=0:Ns-1
        for i=1:Ne
            x = n*Ne+i;
            EHs = EHs + v(x)'*v(x)*(n + 1/2);
            for j=1:Ne
                y = n*Ne+j;
                EHe = EHe + v(x)'*v(y)*Ee*Re(i,j);
                if n~=Ns-1
                    EHI = EHI + v(x)'*v(y+Ne)*EI*sqrt((n+1)/2)*RI(i,j);
                end
                if n~=0
                    EHI = EHI + v(x)'*v(y-Ne)*EI*sqrt(n/2)*RI(i,j);
                end
            end
        end
    end
    Hst(t,idx)=EHs;
    Het(t,idx)=EHe;
    HIt(t,idx)=EHI;
    
    p = zeros(Ns,Ns);
    for n=0:Ns-1
        for m=0:Ns-1
            p(n+1,m+1)=v(n*Ne+1:(n+1)*Ne)'*v(m*Ne+1:(m+1)*Ne);
        end
    end
    ep = eig(p);
    S(t,idx) = -real(sum(ep.*log(ep)));
end

end

% delete(p);

% fig=figure;
% semilogx(tspan,Hst(:,5),'Color','blue');
% hold on;
% semilogx(tspan,HIt(:,5),'Color','#7f7f7f');
% semilogx(tspan,Het(:,5),'Color','red');
% ylim([-2,23]);
% xlabel('t');
% ylabel('H');
% hold off;
% set(fig, 'Position', [100, 100, 800, 400]);
% 
% fig = figure;
% semilogx(tspan,S(:,5)/log(min(Ns,Ne)),'Color','blue');
% xlabel('t');
% ylabel('S/S_{max}');
% set(fig, 'Position', [100, 100, 800, 275]);

% for i=1:Ne*Ns
%     beta(i) = beta(i) * exp(1i*rand()*2*pi);
% end
% 
% for t=1:count+1
%     betat = beta;
%     for j=1:Ne*Ns
%         betat(j) = beta(j) * exp(-1i*val(j)*tspan(t));
%     end
%     v = e*betat;
%     % not enough memory for Hs, He, HI
%     EHs = 0; EHe = 0; EHI = 0;
%     parfor n=0:Ns-1
%         for i=1:Ne
%             x = n*Ne+i;
%             EHs = EHs + v(x)'*v(x)*(n + 1/2);
%             for j=1:Ne
%                 y = n*Ne+j;
%                 EHe = EHe + v(x)'*v(y)*Ee*Re(i,j);
%                 if n~=Ns-1
%                     EHI = EHI + v(x)'*v(y+Ne)*EI*sqrt((n+1)/2)*RI(i,j);
%                 end
%                 if n~=0
%                     EHI = EHI + v(x)'*v(y-Ne)*EI*sqrt(n/2)*RI(i,j);
%                 end
%             end
%         end
%     end
%     Hst_r(t,idx)=EHs;
%     Het_r(t,idx)=EHe;
%     HIt_r(t,idx)=EHI;
% 
%     p = zeros(Ns,Ns);
%     for n=0:Ns-1
%         for m=0:Ns-1
%             p(n+1,m+1)=v(n*Ne+1:(n+1)*Ne)'*v(m*Ne+1:(m+1)*Ne);
%         end
%     end
%     ep = eig(p);
%     S_r(t,idx) = -real(sum(ep.*log(ep)));
% end
