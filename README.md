Romberg implementation

The algorithm is used to estimate a definite integral by applying Richardson extrapolation.

Advantages:
- the possibility of ending the algorithm either by a number of steps or by the desired error
- the function returns why it ended (either by reaching the number of maximum steps or the error value is met)

Disadvantages:
- when the maximum step value is a big number, Matlab will reallocate a lot of times the memory.

In the pdf file you can find some tests (which have been ran by the testRomberg. m file).