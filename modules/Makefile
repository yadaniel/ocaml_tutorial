SRC = main.ml libx.ml liby.ml
CMO = $(patsubst %.ml,%.cmo,$(SRC))
CMI = $(patsubst %.ml,%.cmi,$(SRC))

.PHONY: clean

%.cmo:%.ml
	ocamlc -c $<

main: $(CMO)
	ocamlc $(CMO) -o main

clean:
	rm -f main $(CMO) $(CMI)

