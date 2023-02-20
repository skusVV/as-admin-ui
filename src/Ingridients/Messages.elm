module Ingridients.Messages exposing (..)

import Http exposing (..)
import Ingridients.State exposing (Ingridient)

type Msg
    = GotIngridients (Result Http.Error (List Ingridient))
    | CreateIngridient Ingridient
    | IngirientCreated (Result Http.Error Ingridient)
    | UpdateIngirient Ingridient
    | IngirientUpdated (Result Http.Error Ingridient)
    | SelectIngridient String
    | UnselectIngridient
    | UpdateIngridientId String
    | UpdateIngridientName String
    | UpdateIngridientImg String