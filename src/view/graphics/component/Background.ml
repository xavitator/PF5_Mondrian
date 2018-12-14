open Base
open Graphics

class background color dim coord =
  object (self)
    inherit SLAC.acomponent coord dim as super

    method getLines () : (coords * coords * color * int) list =
      []

    method getRects () : (coords * dim * color) list =
      [((0,0), dim, color)]

    method subClick (c : (coords * color option)) : (SLAC.scene GMessage.t) =
      GMessage.Nothing

    method getStrings () = []
end
