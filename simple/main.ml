#!/usr/bin/ocaml

let rec count (lst: int list) : int = match lst with
    | [] -> 0
    | (x::xs) -> 1 + (count xs)
;;

let rec count' = function
    | [] -> 0
    | (x::xs) -> 1 + (count xs)
;;

let rec count'' = function 
      [] -> 0
    | (x::xs) -> 1 + (count xs)
;;

let rec count''' = function [] -> 0
    | (x::xs) -> 1 + (count xs)
;;

let axyf x y = x +. y

(* as with match the first | can also be omitted *)
type t = | A | B | C | D
type t' = A | B | C | D

(* @@ operator was introduced in Pervasives (the "always opened" module) in 4.01 *)
(* ('a -> 'b) -> 'a -> 'b
 * f @@ x is equivalent to f x. 
 * *)


let main () = Printf.printf "in main\n";
    Printf.printf "%i\n" (count [1;2;3;4]);
    Printf.printf "%i\n" (count' [1;2;3;4]);
    Printf.printf "%i\n" (count'' [1;2;3;4]);
    Printf.printf "%i\n" (count''' [1;2;3;4]);
    Printf.printf "%i\n" @@ count [1;2;3;4];
    let _ = axyf 1.1 1.1 in ();
    ()

let () = main ()

