module Update exposing (..)

import State exposing (Model)
import Messages exposing (Msg)
import Messages exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectTab label ->
         (  { model 
                | selectedPage = label
            }
         , Cmd.none )