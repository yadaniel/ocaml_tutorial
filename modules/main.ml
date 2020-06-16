(* open Libx *)
(* open Liby *)

(* let x: Liby.data = Liby.data.D0;; *)
let x: int = 1;;
let x = 1;;
(* ;; used to ... *)
(* ; used to combine expressions. this gives warning *)
(* let y = 1;2;3;4;; *)

(* somehow required to separate values *)
(* somehow not required to separate values returned from evaluted functions ... compare printf *)
();;
1;;
'.';;
"";;

let f:int->int = fun x -> x;;
let f:int->int->int = fun x -> fun y -> x+y;;

(* ocaml version > 4.01 *)
let (|>) v f = f v
let (<|) f v = f v
let (@@) f v = f v

let s = List.map (fun x -> 2*x) [1;2;3;4];;
let s = List.iter (fun x -> Printf.printf "%X\n" x) [1;2;3;4];;
let s = Array.map (fun x -> 2*x) [|1;2;3;4|];;
let s = Array.iter (fun x -> Printf.printf "%X\n" x) [|1;2;3;4|];;

(* let s = [1;2;3;4] *)
(*     |> (fun x -> 2*x) *)
(*     |> (fun x -> x+1);; *)

(* this expression is evaluted *)
Printf.printf "in file scope\n"

(* this looks like function *)
let () =
    Printf.printf "in ()\n"

(* this expression is evaluated *)
let _ =
    Printf.printf "in ()\n"

(* this is normal function *)
let main() =
    Printf.printf "in main\n"

(* expression must be assigned *)
(* () only works because main returns unit type *)
(* main() *)
let () = main()
let _ = main()

let _ = 1
let () = ()

(* this gives warning pattern matching is not exhaustive *)
(* so actually let () = () works because unit has only one value *)
(* let 1 = 1 *)



