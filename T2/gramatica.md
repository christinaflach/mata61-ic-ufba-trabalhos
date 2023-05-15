# Aspectos Sintáticos de B-

## Declarations and Statements

- In B-Minor, you may declare global variables with optional constant 
initializers, function prototypes, and function definitions. 

- Within functions, you may declare local variables (including arrays) 
with optional initialization expressions. 
Scoping rules are identical to C. 
Function definitions may not be nested.

- Within functions, basic statements may be 
arithmetic expressions, return statements, print statements, 
if and if-else statements, while statements or 
code within inner {} groups (blocks).

- B-Minor does not have switch statements, for-statements, 
or do-while loops.

- The print statement is not a function call. 
It takes one value (NUM) or a variable 
and prints each out to the console, like this:

```print temperatura;
   print 10;
   print a[1];
```

Note that the element following a print statement 
is an expression of type integer. 
