function t=simps(nod,fnod)
delta=(nod(3)-nod(1))/2;
t=(delta/3)*(fnod(1)+4*fnod(2)+fnod(3));
end