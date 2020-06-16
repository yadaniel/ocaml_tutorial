open Sys
open Arg
(* open Dates *)
(* open Stdlib *)
(* open Core *)
(* open Core.Std *)
open List
open Complex
open Random
(* open allows to skip module name *)
(* open Printf *)
open Sqlite3

(* module start with upper case *)

type m = M0 | Mx

module A =
    struct
        type m = M0 | My

        module B =
            struct
                type m = M0 | Mz
            end
    end

let a: m = Mx
open A
open A.B
let a: A.m = A.My
let a: A.B.m = A.B.Mz
(* let a: m = Mx *)
let a: m = Mz

(* types *)
let i: int = 0
let n nativeint = 0n
let f: float = 0.
let b: bool = true
let b: bool = false
let c: char = 'c'
let s: string = "example"

(* more types *)
let a: int array = [|1;2;3;4|]
let l: int list = [1;2;3;4]
let o: int option = None
let o: int option = Some 1

let a': (int*int) array = [|1,1;2,2;3,3;4,4|]
let a': int * int array = (1,[|1;2;3;4|])
let l': int list = 1::2::3::4::[]

(* types must be lower, constructors must be upper case *)
(* record can not be defined in-place *)
type action = int -> int
type point2d = int*int
type 'a point3d = 'a * 'a * 'a
type x = {n:int; m:int}
type data = | D0 | D1 of int | D2 of float | D3 of (int*int) | D4 of x
type data' =  D0 | D1 of int | D2 of float | D3 of (int*int) | D4 of x | D5
(* type data' =  D0 | D1 of int | D2 of float | D3 of (int*int) | D4 of x | d5 *)
(* type data' =  D0 | D1 of int | D2 of float | D3 of (int*int) | D4 of x | D5 of {x:int;y:int} *)
type dx = D0 | D1 of unit
(* type Dx = D0 | D1 of unit *)

(* _ *)
let _ = true
let _ = false
let _: bool = true
let _: bool = false

let f0 a b = a + b;;
let f1 (a: int) b = a + b;;
let f2 (a: int) (b: int) = a + b;;
let f3 (a: int) (b: int) : int = a + b;;
let f4 (a,b: int*int) = a + b;;
let f4' ((a,b): int*int) = a + b;;
let f5 (x: int*int) = (fst x) + (snd x);;

let f6 (a: int option) (b: int option) : int option = 
    match a with
        | None -> None
        | (Some x) -> match b with
            | None -> None
            | Some y -> Some (x+y)

let q0 : int = f0 1 2;;
let q1 : int = f1 1 2;;
let q2 : int = f2 1 2;;
let q3 : int = f3 1 2;;
let q4 : int = f4 (1,2);;
let q4' : int = f4' (1,2);;
let q5 : int = f5 (1,2);;

let rec sum1 (arr: int) : unit = ();;
let rec sum2 (arr: int array) : unit = ();;

print_string "test\n";;
print_string "eins\n";;
print_string "zwei\n";;

let t = time();;
let t = Sys.time();;
Printf.printf "%f\n" t;;

Random.init (int_of_float t);;
(* Random.init 0;; *)
Printf.printf "%i\n" 100;;
Printf.printf "%i\n" 100;;

Printf.printf "%i\n" (Random.int 100);;
Printf.printf "%i\n" (Random.int 100);;
Printf.printf "%i\n" (Random.int 1000);;
Printf.printf "%ni\n" (1n);;
Printf.printf "%ni\n" (Random.nativeint 100n);;
Printf.printf "%b\n" (Random.bool ());;

