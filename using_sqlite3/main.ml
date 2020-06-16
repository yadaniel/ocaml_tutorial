open Printf

(* eval $(opam config env) *)
(* this does not work *)
(* ocamlfind ocamlc -linkall -thread -package sqlite3 main.ml -o main *)
(* this works *)
(* ocamlfind ocamlc -linkpkg -thread -package sqlite3 main.ml -o main *)
open Sqlite3

let db = db_open "test3.db"

let main() =
    Printf.printf "in main\n"
    let _ = match exec db "select * from abc" with
        | Rc.OK -> printf "ok\n"
        | r -> printf "yes\n"
        ;;
    ()

let () = main()

