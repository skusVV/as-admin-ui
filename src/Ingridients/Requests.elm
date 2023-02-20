module Ingridients.Requests exposing (..)

import Json.Encode as Encode
import Http exposing (..)

import Ingridients.Messages exposing (Msg(..))
import Ingridients.Decoders exposing (ingridientsDecoder, ingridientDecoder)
import Ingridients.State exposing(Ingridient)

getIngridients : Cmd Msg
getIngridients =
  Http.get
    { url = "http://localhost:8000/api/ingridients/all"
    , expect = Http.expectJson GotIngridients ingridientsDecoder
    }

createIngridient : Ingridient -> Cmd Msg
createIngridient body =
  Http.post
    { url = "http://localhost:8000/api/ingridient"
    , body = Http.jsonBody (stringifyIngridient body)
    , expect = Http.expectJson IngirientCreated ingridientDecoder
    }  

updateIngridient : Ingridient -> Cmd Msg
updateIngridient body =
  Http.request
    { url = "http://localhost:8000/api/ingridient/"++body.ingredient_id
    , method = "PATCH"
    , body = Http.jsonBody (stringifyIngridient body)
    , expect = Http.expectJson IngirientUpdated ingridientDecoder
    , timeout = Nothing
    , tracker = Nothing
    , headers = []
    } 

stringifyIngridient : Ingridient -> Encode.Value
stringifyIngridient ing =
    Encode.object
        [ ( "name", Encode.string ing.name )
        , ( "img", Encode.string ing.img )
        , ( "ingredient_id", Encode.string ing.ingredient_id )
        ]    