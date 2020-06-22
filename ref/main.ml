#!/bin/ocaml

(* puts the source of modX.ml into current scope *)
#use "modX.ml"

(* load bytecode which was compiled with ocamlc -c modY.ml *)
#load "./modY.cmo"
open ModY

(* load bytecode library *)
(* #load "modY.cma" *)

let f1 () = ()
let f2 () = ()
let f3 () = ()

let sum' n =
    let s = ref 0 in
    !s

let sum'' (xs: int list) =
    let s = ref 0 in 
        List.iter (fun x -> s := !s + x) xs; 
        !s;;

let main init =
    Printf.printf "%s\n" "in main";
    Printf.printf "%i\n" (foobar);
    Printf.printf "%i\n" (foo 9);
    Printf.printf "%i\n" (bar 10);
    Printf.printf "%i\n" (bar' 10);
    Printf.printf "%i\n" (bar'' 10);
    Printf.printf "%i\n" (sum' 10);
    Printf.printf "%i\n" (sum'' [0;1;2;3;4;5;6;7;8;9;10]);
    Printf.printf "%i\n" (sum'' ModY.data');
    Printf.printf "%i\n" (sum'' data');
    ();
    ();
    ();
    f1 ();
    f2 ();
    f3 ()

let () = main()

