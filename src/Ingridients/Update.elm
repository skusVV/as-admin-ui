module Ingridients.Update exposing (..)

import List.Extra as List

import State as AppState
import Ingridients.Messages exposing (..)
import Ingridients.State exposing (..)
import Ingridients.Requests exposing(createIngridient, updateIngridient)

update : Msg -> AppState.State -> ( AppState.State , Cmd Msg )
update msg model =
    case msg of
        GotIngridients result ->
            case result of
                Ok resultText ->
                    (  { model | ingridients = { ingridientsList = resultText, selectedingridient = defaultIngridient, loading = False} }, Cmd.none )

                Err _ ->
                    (model, Cmd.none)
        SelectIngridient id ->
                 (  { model | ingridients = { ingridientsList = model.ingridients.ingridientsList, selectedingridient = findIngridientById model.ingridients.ingridientsList id, loading = False } }, Cmd.none )
        UnselectIngridient ->
            ( { model | ingridients = { ingridientsList = model.ingridients.ingridientsList, selectedingridient = defaultIngridient, loading = False } }, Cmd.none)
        CreateIngridient ing ->
            (model, createIngridient ing)
        IngirientCreated result ->
            case result of
                Ok _ ->
                  -- Model should be updated
                     (model, Cmd.none)

                Err _ ->
                    (model, Cmd.none)
        UpdateIngridientId id ->
            let
    
                oldSelectedIngridient =
                    model.ingridients.selectedingridient
                newSelectedIngridient =
                    {oldSelectedIngridient | ingredient_id = id}
                oldIngridientsModel =
                    model.ingridients
                updatedIngridientsModel =
                    {oldIngridientsModel | selectedingridient = newSelectedIngridient}
            in
        
            (
                {model | ingridients = updatedIngridientsModel}
                , Cmd.none
            )
        UpdateIngridientName name ->
            let
    
                oldSelectedIngridient =
                    model.ingridients.selectedingridient
                newSelectedIngridient =
                    {oldSelectedIngridient | name = name}
                oldIngridientsModel =
                    model.ingridients
                updatedIngridientsModel =
                    {oldIngridientsModel | selectedingridient = newSelectedIngridient}
            in
        
            (
                {model | ingridients = updatedIngridientsModel}
                , Cmd.none
            )
        UpdateIngridientImg img ->
            let
    
                oldSelectedIngridient =
                    model.ingridients.selectedingridient
                newSelectedIngridient =
                    {oldSelectedIngridient | img = img}
                oldIngridientsModel =
                    model.ingridients
                updatedIngridientsModel =
                    {oldIngridientsModel | selectedingridient = newSelectedIngridient}
            in
        
            (
                {model | ingridients = updatedIngridientsModel}
                , Cmd.none
            )
        UpdateIngirient ing->
            (model, updateIngridient ing)
        IngirientUpdated result ->
            case result of
                Ok _ ->
                -- Model should be updated
                     (model, Cmd.none)

                Err _ ->
                    (model, Cmd.none)


findIngridientById : List Ingridient -> String -> Ingridient
findIngridientById ingridientList id =
    if List.length(List.filter (\i -> i.ingredient_id == id) ingridientList) > 0 then 
        Maybe.withDefault defaultIngridient (List.find (\i -> i.ingredient_id == id) ingridientList)
    else defaultIngridient