module Components.Tabs.View exposing (..)

import Html exposing (Html, text, div)

import Messages exposing (Msg)


viewTabs : List String -> Html Msg
viewTabs tabs =
    div []
        (List.map (\l -> div [] [ text l ]) tabs)
