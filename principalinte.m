clear
close all
clc
format long
syms x lp
fprintf('Trapecio - 2 nodos \n Simpson - 3 nodos \n 3/8 - 4 nodos\n')
n=input('Cuantos nodos desea ingresar?: ');
for i=1:n
    fprintf('Ingrese x%d: ',i)
    nod(i)=input('');
    fprintf('Ingrese y%d: ',i)
    fnod(i)=input('');
end

for i=1:n
    for k=1:n
        if i~=k
        lp(i,k)=(x-nod(k))/(nod(i)-nod(k));
        else
            lp(i,k)=1;
        end 
       
    end
end
lpp=prod(lp,2);
for q=1:n
    p(q)=fnod(q)*lpp(q);
end
pp=sum(p);
switch (n)
    case 2
        r=trapec(nod,fnod);
        intex=int(pp,nod(1),nod(2));
        error=abs((intex-r)/intex);
    case 3
        r=simps(nod,fnod);
        intex=int(pp,nod(1),nod(3));
        error=abs((intex-r)/intex);
    case 4
        r=tres4rtos(nod,fnod);
        intex=int(pp,nod(1),nod(4));
        error=abs((intex-r)/intex);
    otherwise
        disp('Opcion no valida')
end
fprintf('Integral exacta: %f\n' ,intex)
fprintf('Integral calculada: %f \n', r)
fprintf('Error = %f \n',error)
fplot(pp)
grid on
hold on
for i=1:n
    plot(nod(i),fnod(i),'o', 'MarkerFaceColor', 'b')
    
end
hold off