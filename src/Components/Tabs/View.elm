module Components.Tabs.View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Messages exposing (Msg)
import Messages exposing (Msg(..))
import State exposing (Page, pageToString)
-- import State exposing (Page)


viewTabs : List Page -> Page -> Html Msg
viewTabs tabs selectedTab =
    div [class "tab"]
        (List.map (\l -> viewTab l selectedTab) tabs)

viewTab : Page -> Page -> Html Msg
viewTab page selectedTab =
    let
        className = 
            if selectedTab == page 
                then "tab-item tab-item-active"
            else 
                "tab-item"
    in
        div [class className, onClick (SelectTab page)] [ text (pageToString page) ]

