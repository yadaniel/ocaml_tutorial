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

let useModY unit : (int*int*int*int) =
    let sum = ModY.calc ModY.Plus 0 1 in
    let difference = ModY.calc ModY.Minus 3 1 in
    let product = ModY.calc ModY.Mult 3 1 in
    let quotient = ModY.calc ModY.Div 8 2 in
    (sum, difference, product, quotient)

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
    f3 ();
    let t = useModY () in
    let t1,t2,t3,t4 = useModY () in
    let (t1',t2',t3',t4') = useModY () in
    (* Printf.printf "%i,%i,%i,%i\n" (let a,b,c,d = t in a,b,c,d); (* a,b,c,d are interpreted as tuple again *)  *)
    Printf.printf "%i,%i,%i,%i\n" (let a,_,_,_ = t in a) (let _,b,_,_ = t in b) (let _,_,c,_ = t in c) (let _,_,_,d = t in d);
    Printf.printf "%i,%i,%i,%i\n" t1 t2 t3 t4;
    Printf.printf "%i,%i,%i,%i\n" t1' t2' t3' t4';
    Printf.printf "%% %@ %!";
    ()

let () = main()

