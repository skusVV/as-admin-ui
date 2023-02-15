module Components.Tabs.View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Messages exposing (Msg)
import Messages exposing (Msg(..))
-- import State exposing (Page)


viewTabs : List String -> String -> Html Msg
viewTabs tabs selectedTab =
    div [class "tab"]
        (List.map (\l -> viewTab l selectedTab) tabs)

viewTab : String -> String -> Html Msg
viewTab label selectedTab =
    let
        className = 
            if selectedTab == label 
                then "tab-item tab-item-active"
            else 
                "tab-item"
    in
        div [class className, onClick (SelectTab label)] [ text label ]

