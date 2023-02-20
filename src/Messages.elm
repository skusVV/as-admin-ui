module Messages exposing (..)

import Http exposing (..)
import State exposing (Page)
import Ingridients.Messages as IngridientsMsg

type Msg
    = SelectTab Page
    | Ingridients IngridientsMsg.Msg
    
