
open Base
open Graphics

(* Contains the set of colors used in the program *)
let table_of_color = [('r', red); ('b', blue)]

(* Key to exit the program *)
let key_quit = 'q'

let getAllColors () =
  table_of_color
  |> List.map (fun (_, c) -> c)

(* Current drawing color *)
let actual_color = ref None


(* Change the current color and returns it *)
let changeColor c =
  let col_tmp = List.find_opt (fun (ch, _) -> c = ch) table_of_color in
  let col = match col_tmp with
    | None -> None
    | Some (_, c) -> Some c
  in
  Option.map_default set_color (white |> set_color) col;
  actual_color := col

(*
   Fonction d'interaction avec l'utilisateur :
   - 'q' pour quitter le jeu
   - 'r'/ 'b' pour mettre en couleur
   - 'n' pour enlever la couleur
*)
let interact () : (coords * color option) option =
  let check_key_pressed () =
    let event =
      let list_events =
        if key_pressed () then [Key_pressed]
        else [Key_pressed; Poll]
      in
      wait_next_event list_events
    in
    if event.keypressed then
      begin
        match event.key with
        | k when k = key_quit -> raise Exit
        | k -> changeColor k
      end
    else ()
  in
  let check_button_pressed () =
    let event =
      wait_next_event [Button_down; Poll]
    in
    if event.button then
      begin
        let mouse = (event.mouse_x, event.mouse_y)
        and screen = (size_x (), size_y ()) in
        if bounds mouse screen
        then Some (mouse, !actual_color)
        else None
      end
    else None
  in
  check_key_pressed ();
  check_button_pressed ()