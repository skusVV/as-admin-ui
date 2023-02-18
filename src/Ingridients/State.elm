module Ingridients.State exposing (..)

type alias Ingridient =
    { name : String
    , img : String
    , ingredient_id : String
    }

type alias IngidientsModel =
    {   ingridientsList: List Ingridient
    ,   selectedingridient: Ingridient
    ,   loading: Bool
    }

defaultModel : IngidientsModel
defaultModel =
    {   ingridientsList = []
    ,   selectedingridient = defaultIngridient
    ,   loading = False
    }

defaultIngridient : Ingridient
defaultIngridient = 
    { name = "", img = "", ingredient_id = ""}