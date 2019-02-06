function [result, out_steps, out_accuracy] = rombergBetter( f, a, b, max_steps, accuracy)
% This function calculates the defined integral of f(x)
% PARAMETERS:
% f (shoud be a symfun object, created by syms), a( lower bound ), b ( higher bound ),
% max_steps (the maximum number of iterations), accuracy (when the difference of computations is less than)
%
% RETURN VALUES:
% result = the result of the computation
% out_steps = 0 or 1, when 1 marks the fact that the function reached it's steps limit
% out_accuracy = 0 or 1, when 1 marks the fact that the function reached
% the desired accuracy
%
% Implemented by: Nedelcescu Radu-Costin 323 AA

h = b - a;

%calculul primului element
R(1, 1) = (f(a) + f(b)) * h * 0.5;
result = R(1,1);

for i = 2: max_steps
   h = h/2;
   % calcularea sumei, necesara pentru calcularea primului element
   sum =0;
   for k = 1: 2^(i-2)
        sum = sum + f(a + (2*k-1)*h);
   end
   % calcularea primului element de pe linia actuala
   R(i, 1) = 0.5* R(i-1, 1) + h*sum;
   % calcularea celorlalte elemente de pe lini actuala
   for j = 2:i
    R(i,j) = R(i,j-1)+ (R(i,j-1) - R(i-1,j-1)) / (4^j-1);
   end
   % daca acuratetea calculului actul este mai mic decat acuratetea
   % necesara atunci se opreste executia functiei
    if (abs(R(i-1,i-1) - R(i,i)) < accuracy)
        result = R(i,i)
        % marcheaza ca s-a iesit deoarece acuratetea este suficient de mica
        [out_steps, out_accuracy] = deal(0,1);
        return
    end
end
% marcheaza ca s-a iesit deoarece s-a ramas fara pasi
[out_steps, out_accuracy] = deal(1,0);
result = R(max_steps, max_steps);

end

