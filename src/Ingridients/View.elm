module Ingridients.View exposing (..)

import Html exposing (Html, text, div, button, input)
import Html.Attributes exposing (class, disabled, placeholder, value)
import Html.Events exposing (onClick, onInput)

import State as App
import Ingridients.Messages exposing (..)
import Ingridients.State exposing (Ingridient)

viewIngridients : App.State -> Html Msg
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
        , viewField "Name" "Provide an name" i.name False UpdateIngridientName
        , viewField "Img" "Provide an image Url" i.ingredient_id isNew UpdateIngridientId
        , button [disabled isNew, onClick (CreateIngridient i)] [text "Create"]
        , button [disabled (not isNew)] [text "Update"]
           
    ]
   

viewField : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
viewField label placeholderValue v isDisabled updateMsg =
    div [ class "field" ] [
          div [ class "field-label"] [ text label]
        , input [ class "field-input", placeholder placeholderValue, value v, disabled isDisabled, onInput updateMsg] []
    ]