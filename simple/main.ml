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

(* built-in infix operators are defined in pervasives *)

(* @@ operator was introduced in Pervasives (the "always opened" module) in 4.01 *)
(* ('a -> 'b) -> 'a -> 'b
 * f @@ x is equivalent to f x. 
 * *)

(* traling ; optional *)
let x = [0;1;2;3;4;];;
let y = [5;6;7;8;9];;
let z = x @ y;;

(* reverse application *)
let q = 1 |> (fun x -> 10*x)
let q' = (1,2) |> (fun (x,y) -> x*y)
let q'' = [1;2] |> (fun (x::y::[]) -> x*y)
(* let q'' = [1;2] |> (fun (x::y) -> (fst x)*(snd y)) *)

let f = function 1 -> 10
    | _ -> 0

let f' = function 1 -> 10 | _ -> 0
let f'' = function 1 -> 2 | 2 -> 3 | _ -> 0
let f''' = function | 1 -> 2 | 2 -> 3 | _ -> 0

let r = (fun x -> function | 1 -> 2 | 2 -> 3 | _ -> 0)
let r' = (fun x -> function | 1 -> 2 | 2 -> 3 | _ -> 0)
let r'' = (fun _ -> function | 1 -> 2 | 2 -> 3 | _ -> 0)
let r''' = (fun x -> x |> function | 1 -> 2 | 2 -> 3 | _ -> 0)



let main () = Printf.printf "in main\n";
    Printf.printf "%i\n" (count [1;2;3;4]);
    Printf.printf "%i\n" (count' [1;2;3;4]);
    Printf.printf "%i\n" (count'' [1;2;3;4]);
    Printf.printf "%i\n" (count''' [1;2;3;4]);
    Printf.printf "%i\n" @@ count [1;2;3;4];
    let _ = axyf 1.1 1.1 in ();
    Printf.printf "%i\n" @@ count z;
    Printf.printf "%i\n" @@ count (x @ y);
    Printf.printf "%i\n" (r' 1 2);
    Printf.printf "%i\n" (r'' () 2);
    Printf.printf "%i\n" (r''' 1);
    ()

let () = main ()

