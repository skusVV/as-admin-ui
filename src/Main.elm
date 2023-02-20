module Main exposing (..)

import Browser

import State as App
import Messages exposing (Msg)
import Update exposing (update)
import View exposing (view)

import Ingridients.Requests exposing(getIngridients)


init : ( App.State, Cmd Msg )
init =
    ( App.defaultModel, getIngridients )

main : Program () App.State Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
