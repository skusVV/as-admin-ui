module Ingridients.View exposing (..)

import Maybe.Extra as Maybe

import Ingridients.Messages exposing (..)
-- import Messages exposing (Msg(..))
import Html exposing (Html, text, div, button, input)
import Html.Attributes exposing (class, disabled, placeholder, value)
import Html.Events exposing (onClick, onInput)
import State as App
-- import Components.Field.Field exposing(viewField)
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
        div [] [
                div [ class "field" ] [
                div [ class "field-label"] [ text "Ingridient Id"]
                , input [ class "field-input", placeholder "Provide an Uniq ID for this Ingridient", value i.ingredient_id, disabled isNew, onInput UpdateIngridientId] []
            ]
        ]
        , div [] [
                div [ class "field" ] [
                div [ class "field-label"] [ text "Name"]
                , input [ class "field-input", placeholder "Provide an image Url", value i.name, disabled False, onInput UpdateIngridientId] []
            ]
        ]
        , div [] [
                div [ class "field" ] [
                div [ class "field-label"] [ text "Img"]
                , input [ class "field-input", placeholder "Provide an image Url", value i.img, disabled False, onInput UpdateIngridientId] []
            ]
        ]
        , button [disabled isNew, onClick (CreateIngridient i)] [text "Create"]
        , button [disabled (not isNew)] [text "Update"]
           
    ]
   

-- viewFieldWrapper = Html.map Messages.Ingridients (viewIngridients model)