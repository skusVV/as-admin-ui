module Update exposing (..)

import State exposing (Model)
import Messages exposing (Msg)

update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )