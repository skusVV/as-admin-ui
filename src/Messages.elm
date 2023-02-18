module Messages exposing (..)

import Http exposing (..)
import State exposing (Page)
import Ingridients.State exposing (Ingridient)

type Msg
    = SelectTab Page

    -- INGRIDIENTS
    | GotIngridients (Result Http.Error (List Ingridient))
    | CreatedIngirient (Result Http.Error Ingridient)
    | SelectIngridient String
    | CreateIngridient Ingridient
    | UpdateIngridientId String
    | UpdateIngridientName String
    | UpdateIngridientImg String
    
