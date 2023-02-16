module Messages exposing (..)

import Http exposing (..)
import State exposing (Page)
import Ingridients.State exposing (Ingridient)

type Msg
    = SelectTab Page
    | GotIngridients (Result Http.Error (List Ingridient))
    | SelectIngridient String
