module Ingridients.Decoders exposing (..)
import Json.Decode exposing (Decoder, list, string, field, map3)
import Ingridients.State exposing (Ingridient)


ingridientsDecoder : Decoder (List Ingridient)
ingridientsDecoder =
  list ingridientDecoder

ingridientDecoder : Decoder Ingridient
ingridientDecoder =
  map3 Ingridient
    (field "name" string)
    (field "img" string)
    (field "ingredient_id" string)
    