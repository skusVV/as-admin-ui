module Main exposing (..)

import Browser

import State exposing (Model, defaultModel)
import Messages exposing (Msg)
import Update exposing (update)
import View exposing (view)

import Ingridients.Requests exposing(getIngridients)


init : ( Model, Cmd Msg )
init =
    ( defaultModel, getIngridients )

main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
