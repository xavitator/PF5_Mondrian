(**
  Exception soulevée à l'appel de get None.
*)
exception No_value

(**
  On applique f à x si x est différent de None, sinon on ne fait rien
*)
let may f x = match x with
  | None -> ()
  | Some v -> f v

(**
  Si x est None, on retourne None, sinon on retourne Some (f x)
*)
let map f x = match x with
  | None -> None
  | Some v -> Some (f v)

(**
  Si x est None, on retourne a, sinon on retourne la valeur de x (on retourne v pour x = Some(v))
*)
let default a x = match x with
  | None -> a
  | Some v -> v

(**
  map_default f x (Some v) retourne f v et map_default f x None retourne x.
*)
let map_default f a x = match x with
  | None -> a
  | Some v -> f v

(**
  is_none None retourne true sinon il retourne false.
*)
let is_none x = match x with
  | None -> true
  | Some _ -> false

(**
  is_some (Some x) retourne true sinon il retourne false.
*)
let is_some x = match x with
  | None -> false
  | Some _ -> true

(**
  get (Some x) retourne x et get None soulève l'exception No_value.
*)
let get x = match x with
  | None -> raise No_value
  | Some v -> v
