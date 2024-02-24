type bop = 
  | Add
  | Mult
  | Leq

type expr = 
  | Int of int
  | Binop of bop * expr * expr
  | Var of string
  | Bool of bool
  | Let of string * expr * expr
  | If of expr * expr * expr
  