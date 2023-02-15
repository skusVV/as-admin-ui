module Categories.View exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div)

viewCategories : Html Msg
viewCategories =
    div [] [text "Categories"]