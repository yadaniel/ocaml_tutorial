open Printf

(* positional *)
(* labeled *)
(* optional w/o default *)
(* optional with default *)
(* when used optional are provided with labels OR all positional *)

(* parameter, formal parameter *)
(* argument, actual parameter *)

(* labeled parameter, default label implicit *)
(* note that function type is a:int->b:int->c:int->int *)
let f ~a ~b ~c : int = a+b*c;;
let f ~(a:int) ~b ~c : int = a+b*c;;
let f ~(a:int) ~b ~(c:int) : int = a+b*c;;
let f ~(a:int) ~(b:int) ~(c:int) : int = a+b*c;;

(* labeled parameter, default label explicit *)
let ff ~a:a ~b:b ~c:c : int = a+b*c;;
let ff ~a:(a:int) ~b:b ~c:c : int = a+b*c;;
let ff ~a:(a:int) ~b:b ~c:(c:int) : int = a+b*c;;
let ff ~a:(a:int) ~b:(b:int) ~c:(c:int) : int = a+b*c;;

(* labeled parameter, label differs from the variable *)
(* ~name:var where name is the label, var the variable in the function body *)
(* note that function type is a:int->b:int->c:int->int, using label names *)
let fff ~a:a' ~b:b' ~c:c' : int = a'+b'*c';;
let fff ~a:(a':int) ~b:b' ~c:c' : int = a'+b'*c';;
let fff ~a:(a':int) ~b:b' ~c:(c':int) : int = a'+b'*c';;
let fff ~a:(a':int) ~b:(b':int) ~c:(c':int) : int = a'+b'*c';;

(* mixing labeled parameter and non-labeled parameter *)
let fm1 ~a b ~c : int = a+b*c;;
(* mixing more than one positional *)
let fm2 ~l1 p1 p2 ~l2 : int = l1+l2-p1-p2;;
let fm2' ~l1 p1 ~l2 p2 : int = l1+l2-p1-p2;;
let fm2'' ~l1 ~l2 p1 p2 : int = l1+l2-p1-p2;;
let fm2''' p1 p2 ~l1 ~l2 : int = l1+l2-p1-p2;;

(* let fx ~a(v:int) = v;; *)
(* labeled with default argument not posible ... that's what optional are used for *)
(* let fx ~a(v:int=1) = v;; *)

(* optional parameter *)
let q ?(a=1) ?(b=10) (c:int): int = a+b*c;;
let q ?(a:int=1) ?(b=10) (c:int): int = a+b*c;;
let q ?(a:int=1) ?(b:int=10) (c:int): int = a+b*c;;

let q ?(a=1) ?(b=10) (c:int): int = a+b*c;;

let main() =
    printf "in main\n"

    let v = f 1 10 0;; printf "%i\n" v;;
    (* let v = (f 1 ~b:10 ~c:0) in printf "%i\n" v;; *)
    (* this gives an error ... the function applied to this argument has the type a:int->int *)
    (* so either all arguments must be supplied with labels OR all arguments must be supplied positional *)
    let v = fm1 ~a:1 10 ~c:0 in printf "fm1 %i\n" v;;
    let v = fm1 ~a:1 ~c:0 10 in printf "fm1 %i\n" v;;
    let v = fm1 1 10 0 in printf "fm1 %i\n" v;;
    (* when labeled and positional parameter are mixed, the same rule applies *)
    (* either all arguments are given positional or all labeled arguments must be given with label *)
    (* let v = fm1 ~a:1 10 0 in printf "fm1 %i\n" v;; *)
    (* let v = fm1 1 10 ~c:0 in printf "fm1 %i\n" v;; *)
    let v = fm2 5 10 0 5 in printf "fm2 %i\n" v;;
    let v = fm2 10 0 ~l1:5 ~l2:5 in printf "fm2 %i\n" v;;
    let v = fm2 10 ~l1:5 0 ~l2:5 in printf "fm2 %i\n" v;;
    let v = fm2 10 ~l1:5 ~l2:5 0 in printf "fm2 %i\n" v;;
    let v = fm2 ~l1:5 10 ~l2:5 0 in printf "fm2 %i\n" v;;
    let v = fm2 ~l1:5 ~l2:5 10 0 in printf "fm2 %i\n" v;;

    let v = f ~a:1 ~c:0 ~b:10;; printf "%i\n" v;;
    let v = f ~a:1 ~b:10 ~c:0 in printf "%i\n" v;;
    let v = f ~c:0 ~b:10 ~a:1 in printf "%i\n" v;;
    let v = f ~b:10 ~a:1 ~c:0 in printf "%i\n" v;;

    let v: int = ff ~a:1 ~c:0 ~b:10;; printf "%i\n" v;;
    let v = ff ~a:1 ~b:10 ~c:0 in printf "%i\n" v;;
    let v = ff ~c:0 ~b:10 ~a:1 in printf "%i\n" v;;
    let v = ff ~b:10 ~a:1 ~c:0 in printf "%i\n" v;;

    let v = fff ~a:1 ~c:0 ~b:10;; printf "%i\n" v;;
    let v = fff ~a:1 ~b:10 ~c:0 in printf "%i\n" v;;
    let v = fff ~c:0 ~b:10 ~a:1 in printf "%i\n" v;;
    let v = fff ~b:10 ~a:1 ~c:0 in printf "%i\n" v;;

    (* let v = q ?(a:1) ?(b:10) 0 in printf "%i\n" v;; *)
    (* let v = q ?a:1 ?b:10 0 in printf "%i\n" v;; *)

let () = main()

(* try ocaml 4.10 *)
(* let f ~a(x:int) ~b(y:int) : int = x+y;; *)
(* let v1 = f ~a:1 ~b:2;; *)
(* let w1 = v1 10 20;; *)
(* let v2 = f 1 2;;  *)
(* let w2 = v2 10 20;; *)
(* let f' ~a:(x:int) ~b:(y:int) : int = x+y;; *)
(* let v': int = f' ~a:1 ~b:2;; *)

(* let f ~a(x:int) ~b(y:int) : int = x+y;; *)
(* val f : a:'a -> int -> b:'b -> int -> int = <fun> *)
(* let v1 = f ~a:1 ~b:2;; *)
(* val v1 : int -> int -> int = <fun> *)
(* let w1 = v1 10 20;; *)
(* val w1 : int = 30 *)
(* let v2 = f 1 2;;  *)
(* val v2 : a:'a -> b:'b -> int = <fun> *)
(* let w2 = v2 10 20;; *)
(* val w2 : int = 3 *)
(* let f' ~a:(x:int) ~b:(y:int) : int = x+y;; *)
(* val f' : a:int -> b:int -> int = <fun> *)
(* let v': int = f' ~a:1 ~b:2;; *)
(* val v' : int = 3 *)

