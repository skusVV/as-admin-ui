module Components.Field.Field exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div, input)
import Html.Attributes exposing (class, placeholder, value)

viewField : String -> String -> String -> Html Msg
viewField label placeholderValue v =
    div [ class "field" ] [
          div [ class "field-label"] [ text label]
        , input [ class "field-input", placeholder placeholderValue, value v] []
    ]