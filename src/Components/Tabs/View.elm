module Components.Tabs.View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import Messages exposing (Msg)


viewTabs : List String -> Html Msg
viewTabs tabs =
    div [class "tab"]
        (List.map (\l -> div [class "tab-item"] [ text l ]) tabs)
