---
layout: post
comments: true
title: Matlab part 1 
---

* [GNU Octave](https://www.gnu.org/software/octave/) is a MATLAB clone! Hail GNU Octave!
* **Getting help**: Use `doc blah` to get help on `blah`. The `blah` can be operators too!
* **Expressions**: example, `5 + 5`, `ans = 10`, `y = sin(pi/2)`. 
* Semicolon implies end of statement and that you want to suppress the output. For example: `sin(pi/2);` will calculate `sin(pi/2)` but will not echo the value of it in the terminal, while mere `sin(pi/2)` does echo the value. The same is true for variable assignment, i.e., `x =2;` will not echo, while `x = 2` does.
* **Comments**: `%` can be used to add in line comments. Use `%{ ... %}` for block comments.
* Commonly used operators:

  Op         Operation
  ---------- ----------------------------------------------------------------------------------------------------------------------------------
  \`+\`      Plus, addition
  \`-\`      Minus, subtraction
  \`\*\`     Scalar and matrix multiplication
  \`.\*\`    Array multiplication operator, element wise multiplication
  \`\^\`     Scalar and matrix exponentiation operator
  \`.\^\`    Array exponentiation operator, element wise exponentiation
  \`\`       Left division operator, \`A\B\` solves the system \`Ax = B\`
  \`/\`      Right division operator, \`A/B\` solves the system \`Bx = A\`
  \`.\`      Array left division, \`A.\B\` does the left division pair wise
  \`./\`     Array right division
  \`:\`      Produces regularly spaced elements \`j:k\` is same as \`\[j j+1 ... j+k\]\` and \`j:i:k\` is same as \`\[j j+i j+2i ... j+mi\]\`
  \`()\`     Parenthesis; encloses function argument; **\*array indices\***; overrides precision
  \`\[\]\`   Brackets; used to define array, e.g., \`x = \[1 2\]\`
  \`.\`      Decimal point
  \`,\`      Separates statements and elements in a row
  \`;\`      Separates columns and suppresses display
  \`'\`      Used to calculate transpose
  \`.'\`     Non-conjugated transpose operator
  \`=\`      Assignment operator

* Special: `ans` represent the most recent answer; `i,j` for complex numbers; `inf` represent Infinity; `NaN` undefined number (not a number); `pi` the number $\pi$.
* *Variable* consist of a letter followed by any number of letters, digits, or underscores and MATLAB is case-sensitive.
* **Creating vectors**:
  * `r = [1 2 3]` and `r = [1, 2, 3]` are the same and are ways in which one can create row vectors.
  * `r = [1; 2; 3]` represent a column vector. `[1; 2; 3] = [1 2 3]'`.
* **Creating Matrices**:
  * `mat = [1 2 3; 4 5 6; 7 8 9]`
* **Commands**:
  * `clc` to clear command window, `clear` to remove variables from memory, `exist` to check whether a variable exist, `global` to declare a variable as global, `quit` to quit MATLAB, `who` to list current variable, `whos` to give a longer display.
* **Formatting and I/O**: `disp` to display contents of an array or a string, `fscanf` for inputs, `fprintf` for printing, `input` for taking input.
* **Commands**:

  Function       Operation
  -------------- --------------------------------------
  \`cat\`        concatenates arrays
  \`find\`       finds indices of nonzero elements
  \`length\`     computes the number of elements
  \`linspace\`   Creates a regularly spaced vector
  \`max\`        Returns the maximum element
  \`min\`        Returns the smallest element
  \`prod\`       Product of each column
  \`reshape\`    Changes the size
  \`sort\`       Sorts each column
  \`sum\`        sums each column
  \`eye\`        Creates an identity matrix
  \`ones\`       Creates an array of ones
  \`zeros\`      Creates an array of zeros
  \`dot\`        Computes the dot product
  \`det\`        Computes the determinant of a matrix
  \`ceil\`       Computes the ceiling of a number


* **Plotting**:

  Name          Function
  ------------- ----------------------------------------------------------------------
  \`axis\`      Set axis limits
  \`fplot\`     intelligent plot of functions, use anonymous function as first input
  \`grid\`      displays grid lines
  \`plot\`      Generates an $xy$ plot, even for matrices
  \`print\`     Prints plot or saves plot into a file
  \`title\`     Puts up a title at the top of the plot
  \`xlabel\`    Adds an xlabel to the plot
  \`ylabel\`    Adds a ylabel to the plot
  \`figure\`    Opens up a new window for plot
  \`legend\`    Legend placement by mouse
  \`subplot\`   Creates plot in sub-windows
  \`bar\`       Creates a bar plot
  \`hist\`      Creates a histogram
  \`hist3d\`    Creates a 3-dimensional histogram
  \`hist2d\`    Creates a 2-dimensional histogram


* **Scripts**
  * Scripts are programs with `.m` extension. One can write a series of commands, but this does not accept input and does not return output.
  * **Functions** are programs in `.m` extension. They can accept input and return output. The file in which the function is written should have the name of the first function in the file. For example, if the name of the first function in the file is `fun`, then the name of the Matlab script should be `fun.m`.
  * Function syntax: `function [x1, x2, ..., xn] = funtion-name(i1, i2, ...,im)`. 
* Matlab does not use curly braces to denote scope. Instead for things like `if`, loops, etc, one can make use of the end command to denote the end of the current scope.
* **Loops**:
  * `while`: use `while (expression) ... end`
  * `for`: use `for a = 10:20 .. end`. Here `a = 10:20` is a sample and can be replaced with similar command that suits the need.
  * One can use `break` command to exit from the loop, if required.

* **Some useful functions**:

| `mvnpdf`| Multivariate normal pdf|
| `mvncdf`| Multivariate cumulative cdf|
 

