
let data : int array = [|1;2;3;4;|];;
let data' : int list = [1;2;3;4;];;

(* local function *)
let f x y =
    let f' x' y' = x'+y' in f' x y


type op = Plus | Minus | Mult | Div

let calc op x1 x2 =
    let plus x y = x + y in
    let minus x y = x - y in
    let mult x y = x * y in
    let div x y = x / y in
    match op with
        Plus -> plus x1 x2
        | Minus -> minus x1 x2
        | Mult -> mult x1 x2
        | Div -> div x1 x2


(* let rec f n m = *)
(*     let sum = match n with *)
(*         | 0 -> f' m *)
(*         | _ -> n-1 *)
(*     let rec f' n *)

(* f::Int->Int->Int *)
(* let f n m = f' 0 n m  *)
(*     where f' acc n m =  *)
(*         case (n,m) of *)
(*          | (0,0) -> acc *)
(*          | (0,_) -> f' (acc+1) n (m-1) *)
(*          | (_,0) -> f' (acc+1) (n-1) m *)
(*          | _ -> f' (acc+1) (n-1) m *)

