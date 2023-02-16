module Ingridients.State exposing (..)

type alias Ingridient =
    { name : String
    , img : String
    , ingredient_id : String
    }

type alias IngidientsModel =
    {   ingridientsList: List Ingridient
    ,   selectedingridient: Maybe Ingridient
    ,   loading: Bool
    ,   justTestString: String
    }

defaultModel : IngidientsModel
defaultModel =
    {   ingridientsList = []
    ,   selectedingridient = Nothing
    ,   loading = False
    ,   justTestString = ""
    }