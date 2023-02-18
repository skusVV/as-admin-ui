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

    div [class "ingredient-container"] [
            div [class "ingredient-list"] 
            (List.map (\l -> div [ class "ingredient-list-item", onClick (SelectIngridient l.ingredient_id) ] [text l.name])
                model.ingridients.ingridientsList)
        , div [class "ingredient-form"] [ viewIngridientForm model.ingridients.selectedingridient ]
    ]

viewIngridientForm : Ingridient -> Html Msg
viewIngridientForm i =
    let
        isOldIngridient = 
            not (String.isEmpty i.ingredient_id)
    in
    div [] [
          viewField "Ingridient Id" "Provide an Uniq ID for this Ingridient" i.ingredient_id isOldIngridient
        , viewField "Name" "Provide a name" i.name False
        , viewField "Img" "Provide an image Url" i.img False
        , button [disabled isOldIngridient] [text "Create"]
        , button [disabled (not isOldIngridient)] [text "Update"]
    ]