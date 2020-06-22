(* module modX *)

let foo x = x + 1

let rec bar n =  
    match n with
        | 0 -> 0
        | n' -> n' + bar (n'-1)

let rec bar' n =  
    let t = match n with
        | 0 -> 0
        | n' -> n' + bar (n'-1)
     in t

let rec bar'' n =  
    let t = match n with
        | 0 -> 0
        | n' -> bar (n'-1)
     in t + n

let foobar = match 1 with
    | 1 -> 1
    | _ -> 2 

