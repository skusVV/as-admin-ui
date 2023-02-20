module State exposing (..)

import Ingridients.State exposing(IngidientsModel, defaultIngridient)

type Page = 
    Authors String
    | Recipies String
    | Categories String   
    | Ingridients String  

type alias State =
    {   pages: List Page
    ,   selectedPage: Page
    ,   ingridients: IngidientsModel
    }

defaultModel : State
defaultModel =
    {   pages = [Ingridients "Ingridients" ,Authors "Authors", Recipies "Recipies", Categories "Categories"]
    ,   selectedPage = Ingridients "Ingridients"
    ,   ingridients = { loading = False
                      , ingridientsList = []
                      , selectedingridient = defaultIngridient
                    }
    }

pageToString : Page -> String
pageToString page =
  case page of
    Authors label ->
      label

    Recipies label ->
      label
      
    Categories label ->
      label

    Ingridients label ->
      label
