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
        GotIngridients result ->
            case result of
                Ok resultText ->
                    (  { model | ingridients = { ingridientsList = resultText, selectedingridient = Nothing, loading = False, justTestString = ""} }, Cmd.none )

                Err _ ->
                    (model, Cmd.none)
         