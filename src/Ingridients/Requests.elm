module Ingridients.Requests exposing (..)

import Http exposing (..)
import Messages exposing (Msg(..))
import Ingridients.Decoders exposing (ingridientsDecoder)



getIngridients : Cmd Msg
getIngridients =
  Http.get
    { url = "http://localhost:8000/api/ingridients/all"
    , expect = Http.expectJson GotIngridients ingridientsDecoder
    }