# Homework 2: OCaml


**This is an individual assignment. You must work on this homework alone.**

## Introduction

The goal of this homework is to get you familiar with programming in OCaml. You will have to write a number of small functions, each of which is specified in three sections below.

We recommend you get started right away, going from top to bottom. The problems get increasingly more challenging, and in some cases later problems can take advantage of earlier solutions.

### Ground Rules

In all problems, a `date` is an OCaml value of type `int * int * int`, where the first part is the year, the
second part is the month, and the third part is the day. For example, (2023, 1, 15) represents the 15th
day of the first month (January) in the year 2023.

A "reasonable" date has a positive year, a month between 1 and 12, and a day no greater than 31 (or less
depending on the month). Your solutions need to work correctly only for reasonable dates, but do not check
for reasonable dates and many of your functions will naturally work correctly
for some non-reasonable dates.

### Testing & Submitting

To test locally, run `dune runtest -f` from the homework directory. We recommend you write student tests in `test/student/student.ml`.

You can interactively test your code by doing `dune utop src` (assuming you have `utop`). Then you should be able to use any of the functions. All of your commands in `utop` need to end with two semicolons (i.e. `;;`), otherwise it will appear that your terminal is hanging.


### Homework Files

The following are the relevant files for your code:

- OCaml Files
    - **src/basics.ml**: You will **write your code here**, in this file. 
    - **src/basics.mli**: This file is used to describe the signature of all the functions in the module.  *Do not modify this file*; 
    
### Notes on OCaml

OCaml is a lot different than languages you're likely used to working with, and we'd like to point out a few quirks here that may help you work your way out of common issues with the language.

- Unlike most other languages, = in OCaml is the operator for structural equality whereas == is the operator for physical equality. All functions in this homework (and in this course, unless ever specified otherwise) are concerned with *structural* equality.
- The binary subtraction operator (`-`) also doubles as the unary minus operator for `int`s and `float`s in OCaml. As a result, the parser has trouble identifying the difference between subtraction and a negative number. When writing negative numbers, it's safest to surround them in parentheses; e.g., `some_function 5 (-10)` works, where `some_function 5 -10` will give an error.
- Recursive functions in OCaml require the use of the `rec` keyword. We don't include the `rec` keyword for certain functions in `basics.ml` to show that the function can be written without recursion. Adding `rec` to a non-recursive function usually has no effect (unless there is some sort of shadowing going on).

### Important Notes about this Homework

1. Some parts of this homework are additive, meaning your solutions to earlier functions can be used to aid in writing later functions. 
2. You can always add a helper function for any of the functions we ask you to implement, and the helper function can also be recursive.
3. You may move around the function definitions. In OCaml, in order to use one function inside of another, you need to define the function before it is called. For example, if you think that a function from Part 2 can be used to help you implement a function in Part 1, you can move your implementation of the function from the Part 2 section to before the function in Part 1. As long as you still pass the tests and you haven't created a syntax error, you are fine.
4. Pay special notice to a function's type. Often times, you can lose sight of what you're trying to do if you don't remind yourself of the types of the arguments  and the type of what you're trying to return.
5. You may rename arguments however you would like, but **do not modify function's name**. Doing so will cause you to fail the function's tests.

## Part 1: Non-Recursive Functions

Implement the following functions that do not require recursion. Accordingly, these functions are defined without the `rec` keyword, but **you MAY add the `rec` keyword to any of the following functions or write a recursive helper function**. Just remember that if you write a helper function, it must be defined in the file before it is called.

#### `rev_tup (tup:('a * 'b))`

- **Type**: `'a * 'b * 'c -> 'c * 'b * 'a`
- **Description**: Returns a tuple in the reverse order of `tup`.
- **Examples**:
   ```ocaml
   rev_tup (1, 2) = (2, 1)
   rev_tup (1, 1) = (1, 1)
   rev_tup ("a", 1) = (1, "a")
   ```

#### `rev_triple (triple:('a * 'b * 'c ))`

- **Type**: `'a * 'b * 'c -> 'c * 'b * 'a`
- **Description**: Returns a triple in the reverse order of `triple`.
- **Examples**:
   ```ocaml
   rev_triple((1, 2, 3)) = (3, 2, 1)
   rev_triple((1, 1, 1)) = (1, 1, 1)
   rev_triple(("a", 1, "c")) = ("c", 1, "a")
   ```

#### `is_odd(x:int)`

- **Type**: `int -> bool`
- **Description**: Returns whether or not `x` is odd.
- **Examples**:
  ```ocaml
  is_odd 1 = true
  is_odd 4 = false
  is_odd 9 = true
  ```

#### `is_older(date1 :(int * int * int), date2:(int * int * int))`
- **Type**: `(int * int * int)->(int * int * int)-> bool`
- **Description**: Returns whether `date1` comes before the `date2`.
- **Examples**:
  ```ocaml
  is_older (2021, 1, 15), (2020, 1, 16) = false
  is_older (2022, 1, 15), (2021, 2, 16) = false
  is_older (2022, 1, 16), (2021, 2, 1) = false
  is_older (2021, 1, 14), (2021, 1, 15) = true
  ```

#### `to_us_format(date1 :(int * int * int)`
- **Type**: `(int * int * int)->(int * int * int)`
- **Description**: Convert `date` which appears as (Year, Month, Day) to US format (Month, Day, Year).
- **Examples**:
  ```ocaml
  to_us_format (2021,1,15) = (1, 15, 2021)
  to_us_format (2022,1,15) = (1, 15, 2022) 
  to_us_format (2022,10,16) = (10, 16, 2022)
  to_us_format (2021,12,6) = (12, 6, 2021) 
  ```


## Part 2: Recursive Functions

Implement the following functions using recursion.


#### `pow (x:int, p:int)`

- **Type**: `int -> int -> int`
- **Description**: Returns `x` raised to the power `p`.
- **Assumptions**: `p` is non-negative, and we will **not** test your code for integer overflow cases.
- **Examples**:
  ```ocaml
  pow 3, 1 = 3
  pow 3, 2 = 9
  pow (-3), 3 = -27
  ```

#### `fac (x:int)`
- **Type**: `int -> int`
- **Description**: Returns the factorial of `x` as an integer.
- **Assumptions**: You may assume the answer is non-negative, `x` >= 1.
- **Examples**:
  ``` ocaml
  fac 4 = 24
  fac 5 = 120
  fac 7 = 5040
  fac 2 = 2
  ```

## Part 3: Lists

#### `get_nth ((idx : int), (lst: 'a list))`

- **Type**: `int -> 'a list -> 'a`
- **Description**: Returns the element at the index `idx` in the list `lst`. 
- **Assumptions**: `idx` is non-negative.
- **Examples**:
  ```ocaml
  get_nth 0, [26; 11; 99] = 26
  get_nth 1, [26; 11; 99] = 11
  get_nth 2, [26; 11; 99] = 99
  get_nth 0, ["a"; "b"] = "a"
  get_nth 1 ["a"; "b"] = "b"
  ```

#### `larger ((lst1: 'a list), (lst2: 'a list))`

- **Type**: `'a list -> 'a list -> 'a list`
- **Description**: Returns the longer list provided as an argument, returns the empty list if the two lists are the same length.
- **Examples**:
  ```ocaml
  larger [] [] = []
  larger [1] [2; 3] = [2; 3]
  larger [2; 4] [2] = [2; 4]
  larger [4; 1; 2] [3; 5; 7] = []
  ```

#### `sum((lst1: int list), (lst12: int list))`

- **Type**: `int list -> int list -> int`
- **Description**: Returns the sum of both lists i.e., sum of the elements of `lst1` and the elements of `lst2`. 
- **Examples**:
  ```ocaml
  sum [] [] = 0
  sum [] [3; 4] = 7
  sum [1; 2; 3; 4] [3; 4; 5] = 22
  sum [1; 2; 3; 4] [-3; 4; 5] = 16
  ```


Good luck!
