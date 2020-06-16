rm -f main *.cmo *.cmi
ocamlc -c *.ml
ocamlc *.cmo -o main

# ocamlfind ocamlopt -linkpkg -package base -package stdio freq.ml -o freq

