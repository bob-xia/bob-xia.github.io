EffD = [0,0,0,0,0];

for i=1:5
    EffD(i) = 1/sum(power(conj(betaS(:,i)).*betaS(:,i),2));
end

EffD
m = mean(EffD)
s = std(EffD)
s/m