eval $(opam config env)

# only -linkpkg works for sqlite3
ocamlfind ocamlc -linkall -thread -package sqlite3 main.ml -o main
ocamlfind ocamlc -linkpkg -thread -package sqlite3 main.ml -o main

# both works for base
ocamlfind ocamlc -linkall -thread -package base main.ml -o main
ocamlfind ocamlc -linkpkg -thread -package base main.ml -o main

eval $(opam env)
