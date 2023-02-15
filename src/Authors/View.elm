module Authors.View exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, text, div)

viewAuthors : Html Msg
viewAuthors =
    div [] [text "Authors"]