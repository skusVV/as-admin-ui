module Components.Field.Field exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div, input)
import Html.Attributes exposing (class, placeholder, value, disabled)
import Html.Events exposing (onInput)

viewField : String -> String -> String -> Bool -> (String -> Msg) -> Html Msg
viewField label placeholderValue v isDisabled updateMsg =
    div [ class "field" ] [
          div [ class "field-label"] [ text label]
        , input [ class "field-input", placeholder placeholderValue, value v, disabled isDisabled, onInput updateMsg] []
    ]