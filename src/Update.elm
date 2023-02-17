module Update exposing (..)

import List.Extra as List

import State exposing (Model)

import Messages exposing (Msg)
import Messages exposing (Msg(..))
import State exposing (Page(..))
import Ingridients.State exposing(Ingridient)

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
                    (  { model | ingridients = { ingridientsList = resultText, selectedingridient = Nothing, loading = False} }, Cmd.none )

                Err _ ->
                    (model, Cmd.none)
        SelectIngridient id ->
                 (  { model | ingridients = { ingridientsList = model.ingridients.ingridientsList, selectedingridient = findIngridientById model.ingridients.ingridientsList id, loading = False} }, Cmd.none )
        CreateIngridient _ ->
                (model, Cmd.none)
        

findIngridientById : List Ingridient -> String -> Maybe Ingridient
findIngridientById ingridientList id =
    List.find (\i -> i.ingredient_id == id) ingridientList
    