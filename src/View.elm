module View exposing (..)

import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src, class)

import State exposing (Model)
import Messages exposing (Msg)
import Components.Tabs.View exposing (viewTabs)


view : Model -> Html Msg
view model =
    div [ class "container"]
        [ viewTabs model.pages
        ]
