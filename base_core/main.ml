(* Base:         minimal stdlib replacement. Portable and lightweight and intended to be highly stable. *)
(* Core_kernel:  Extension of Base. More full featured, with more code and dependencies,  *)
(*               and APIs that evolve more quickly. Portable, and works on Javascript. *)
(* Core:         Core_kernel extended with UNIX APIs *)

(* does not compile when order of open is changed *)
open Printf
open Base

(* on the top level *)
(* let _ = expr *)
(* otherwise *)
(* let _ = expr1 in expr2 *)


(* Here, the type of Printf.printf is ('a, out_channel, unit) format -> 'a which means: *)
(*     'a: printf takes a format string plus as many argument as required by the format *)
(*     out_channel: it writes on a out_channel *)
(*     unit : ultimately, it returns unit. *)

(* irrefutable patterns *)
let foo = function
    | _ -> 0

(* irrefutable patterns *)
let bar x = match x with
    | _ -> 0

(* irrefutable patterns *)
let foobar = function
    | x -> 0

(* irrefutable patterns *)
(* parameter is implicit ... cannot type it *)
let foobar' = function
    | () -> 0

let (<!>) a b = (a+b)*(a-b)

let p1 unit : unit = ()
let p2 unit : unit = ()
let p3 unit : unit = ()

(* all work, unit is type ... () is type and value of itself *)
(* let main unit = *)
(* let main unit : unit = *)
let main () =

    let _ = match 1 with
        | 1 -> 1
        | 2 -> 2
        | 3 -> 3
        | 4 -> 4
        | _ -> 0 in () ;;

    printf "using infix <!> %i\n" (1 <!> 1);
    printf "using prefix (<!>) %i\n" ((<!>) 1 1);
    printf "%i\n" (foo 1);
    printf "%i\n" (bar 1);
    printf "%i\n" (foobar 1);
    p1 ();

    printf "%i\n" (foobar 1);
    (* bprintf "%i" 1 *)
    ()

let _ = main ()

