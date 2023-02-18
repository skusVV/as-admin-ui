module Ingridients.View exposing (..)

import Maybe.Extra as Maybe

import Messages exposing (Msg)
import Messages exposing (Msg(..))
import Html exposing (Html, text, div, button)
import Html.Attributes exposing (class, disabled)
import Html.Events exposing (onClick)
import State exposing (Model)
import Components.Field.Field exposing(viewField)
import Ingridients.State exposing (Ingridient)

viewIngridients : Model -> Html Msg
viewIngridients model =
    let
        isNew = 
            List.length(List.filter (\i -> i.ingredient_id == model.ingridients.selectedingridient.ingredient_id) model.ingridients.ingridientsList) > 0 
    in
    div [class "ingredient-container"] [
            div [class "ingredient-list"] 
            (List.map (\l -> div [ class "ingredient-list-item", onClick (SelectIngridient l.ingredient_id) ] [text l.name])
                model.ingridients.ingridientsList)
        , div [class "ingredient-form"] [ viewIngridientForm model.ingridients.selectedingridient isNew ]
    ]

viewIngridientForm : Ingridient -> Bool -> Html Msg
viewIngridientForm i isNew =
    div [] [
          viewField "Ingridient Id" "Provide an Uniq ID for this Ingridient" i.ingredient_id isNew UpdateIngridientId
        , viewField "Name" "Provide a name" i.name False UpdateIngridientName
        , viewField "Img" "Provide an image Url" i.img False UpdateIngridientImg
        , button [disabled isNew, onClick (CreateIngridient i)] [text "Create"]
        , button [disabled (not isNew)] [text "Update"]
    ]