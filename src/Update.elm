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
                    (  { model | ingridients = { ingridientsList = resultText, selectedingridient = defaultIngridient, loading = False} }, Cmd.none )

                Err _ ->
                    (model, Cmd.none)
        SelectIngridient id ->
                 (  { model | ingridients = { ingridientsList = model.ingridients.ingridientsList, selectedingridient = findIngridientById model.ingridients.ingridientsList id, loading = False} }, Cmd.none )
        CreateIngridient _ ->
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


findIngridientById : List Ingridient -> String -> Ingridient
findIngridientById ingridientList id =
    if List.length(List.filter (\i -> i.ingredient_id == id) ingridientList) > 0 then 
        Maybe.withDefault defaultIngridient (List.find (\i -> i.ingredient_id == id) ingridientList)
    else defaultIngridient
    