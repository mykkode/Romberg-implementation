syms F(x);
syms f(x);

%d efinim valorile folosite pentru teste
a = 5;
b = 10;
max_steps = 10;
accuracy = 0.000001;

% printam ceste valori
txt = sprintf('Urmatoarele teste vor rula cu: a=%d b=%d, max_steps= %d, accuracy=%f', a,b,max_steps,accuracy);
    disp(txt);
% generam primele 5 functii putere ale lui x si integratele acesteia, dupa
% care chemam functia romberg si mai apoi o comparam cu rezultatul real
for i = 1:5

    %integrata si functia
    f(x)=x^i;
    F(x)=x^(i+1)/(i+1);
    %calculam valoarea integratei
    real = F(b)-F(a);
    %chemam functia si prelum variabilele returnate
    [result, out_steps, out_accuracy] = rombergBetter(f, a, b, max_steps, accuracy);
    
    %afiseaza rezultatele
    txt = sprintf('=========================');
    disp(txt);
    f(x)
    F(x)
    txt = sprintf('Calculated by Romberg: %f Real Value: %f Error: %f', result, real, real-result);
    disp(txt);
    txt = sprintf('=========================');
    disp(txt);
    
end

%executam functia si pentru cosinus

    f(x)=cos(x);
    F(x)=sin(x);
    real = F(b)-F(a);
    [result, out_steps, out_accuracy] = rombergBetter(f, a, b, max_steps, accuracy);
    
    txt = sprintf('=========================');
    disp(txt);
    f(x)
    F(x)
    txt = sprintf('Calculated by Romberg: %f Real Value: %f Error: %f', result, real, real-result);
    disp(txt);
    txt = sprintf('=========================');
    disp(txt);