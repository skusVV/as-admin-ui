module Update exposing (..)



import State as App
import Messages exposing (Msg(..))
import Ingridients.Update as IngridientsUpd

update : Msg -> App.State -> ( App.State , Cmd Msg )
update message state =
    case message of
        SelectTab label ->
         (  { state 
                | selectedPage = label
            }
         , Cmd.none )
        Ingridients msg ->
            let
                ( newState, newCommand ) =
                    IngridientsUpd.update msg state
            in
            ( newState, Cmd.map Ingridients newCommand )
        
    