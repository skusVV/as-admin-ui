module Ingridients.View exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div)
import Html.Attributes exposing (class)
import State exposing (Model)

viewIngridients : Model -> Html Msg
viewIngridients model =
    div [class "ingredient-container"] [
            div [class "ingredient-list"] 
            (List.map (\l -> div [ class "ingredient-list-item"] [text l.name]) model.ingridients.ingridientsList)
        , div [class "ingredient-form"] []
    ]