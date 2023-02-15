module Recipies.View exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div)

viewRecipies : Html Msg
viewRecipies =
    div [] [text "Recipies"]