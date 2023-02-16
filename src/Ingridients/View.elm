module Ingridients.View exposing (..)

import Maybe.Extra as Maybe

import Messages exposing (Msg)
import Messages exposing (Msg(..))
import Html exposing (Html, text, div, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import State exposing (Model)
import Components.Field.Field exposing(viewField)
import Ingridients.State exposing (Ingridient)
import Html.Attributes exposing (id)

viewIngridients : Model -> Html Msg
viewIngridients model =

    div [class "ingredient-container"] [
            div [class "ingredient-list"] 
            (List.map (\l -> div [ class "ingredient-list-item", onClick (SelectIngridient l.ingredient_id) ] [text l.name]) model.ingridients.ingridientsList)
        , div [class "ingredient-form"] [ viewIngridientForm model.ingridients.selectedingridient ]
    ]

viewIngridientForm : Maybe Ingridient -> Html Msg
viewIngridientForm i =
    let
        safeIngridient =
            i |> Maybe.withDefault {ingredient_id = "", name="", img= ""}
    in
    div [] [
          viewField "Ingridient Id" "Provide an Uniq ID for this Ingridient" safeIngridient.ingredient_id
        , viewField "Name" "Provide a name" safeIngridient.name
        , viewField "Img" "Provide an image Url" safeIngridient.img
        , button [] [text "Create"]
        , button [] [text "Update"]
    ]