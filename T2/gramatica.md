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

## Functions

Functions are declared in the same way as variables, except giving a type of function followed by the return type, arguments, and code:

```
square: function integer ( x: integer ) = {
    return xˆ2;
}
``` 

- The return type of a function must be one of the two atomic types,
or void to indicate no type. 

- Function arguments may be of any type: integer or boolean are passed 
by value, while array arguments are passed by reference. 
As in C, arrays passed by reference have an indeterminate size, and so the length is typically passed
as an extra argument (e.g. ```size``` below):

```
printarray: function void
 ( a: array [] integer, size: integer ) = {
    i: integer;
    ... etc.}
```

- A complete program must have a main function that returns an integer. 
The arguments to main may either be empty, 
or use argc and argv in the same manner as C. 


