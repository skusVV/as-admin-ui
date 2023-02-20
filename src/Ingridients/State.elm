module Ingridients.State exposing (..)

type alias Ingridient =
    { name : String
    , img : String
    , ingredient_id : String
    }

type alias State =
    {   ingridientsList: List Ingridient
    ,   selectedingridient: Ingridient
    ,   loading: Bool
    }

defaultModel : State
defaultModel =
    {   ingridientsList = []
    ,   selectedingridient = defaultIngridient
    ,   loading = False
    }

defaultIngridient : Ingridient
defaultIngridient = 
    { name = "", img = "", ingredient_id = ""}