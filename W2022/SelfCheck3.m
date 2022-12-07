S = @(a,b) (a^2 * 9) + (4 * a *b * 3);
g= @(v) S(v(1),v(2)); 

[v,opt] = fmincon(g,[1,1],[],[],[],[],[],[],@confunKarton,[])

x=v(1)
y=v(2)
opt