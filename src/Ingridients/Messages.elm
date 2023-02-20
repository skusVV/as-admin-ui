module Ingridients.Messages exposing (..)

import Http exposing (..)
import Ingridients.State exposing (Ingridient)

type Msg
    = GotIngridients (Result Http.Error (List Ingridient))
    | CreatedIngirient (Result Http.Error Ingridient)
    | SelectIngridient String
    | CreateIngridient Ingridient
    | UpdateIngridientId String
    | UpdateIngridientName String
    | UpdateIngridientImg String