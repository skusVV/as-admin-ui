module Update exposing (..)

import List.Extra as List

import State exposing (Model)

import Messages exposing (Msg)
import Messages exposing (Msg(..))
import State exposing (Page(..))
import Ingridients.State exposing(Ingridient, defaultIngridient)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectTab label ->
         (  { model 
                | selectedPage = label
            }
         , Cmd.none )
        -- INGRIDIENTS
        GotIngridients result ->
            case result of
                Ok resultText ->
                    (  { model | ingridients = { ingridientsList = resultText, selectedingridient = { name = "", img = "", ingredient_id = ""}, loading = False} }, Cmd.none )

                Err _ ->
                    (model, Cmd.none)
        SelectIngridient id ->
                 (  { model | ingridients = { ingridientsList = model.ingridients.ingridientsList, selectedingridient = findIngridientById model.ingridients.ingridientsList id, loading = False} }, Cmd.none )
        CreateIngridient _ ->
            (model, Cmd.none)
        UpdateIngridientId _ ->
        
            (
                model
                , Cmd.none
            )


findIngridientById : List Ingridient -> String -> Ingridient
findIngridientById ingridientList id =
    if List.length(List.filter (\i -> i.ingredient_id == id) ingridientList) > 0 then 
        Maybe.withDefault defaultIngridient (List.find (\i -> i.ingredient_id == id) ingridientList)
    else defaultIngridient
    