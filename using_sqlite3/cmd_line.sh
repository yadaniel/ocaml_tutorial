eval $(opam config env)
ocamlfind ocamlc -linkall -thread -package sqlite3 main.ml -o main
ocamlfind ocamlc -linkpkg -thread -package sqlite3 main.ml -o main

