module State exposing (..)

import Ingridients.State exposing(IngidientsModel)

type Page = 
    Authors String
    | Recipies String
    | Categories String   
    | Ingridients String  

type alias Model =
    {   pages: List Page
    ,   selectedPage: Page
    ,   ingridients: IngidientsModel
    }

defaultModel : Model
defaultModel =
    {   pages = [Ingridients "Ingridients" ,Authors "Authors", Recipies "Recipies", Categories "Categories"]
    ,   selectedPage = Ingridients "Ingridients"
    ,   ingridients = { loading = False
                      , ingridientsList = []
                      , selectedingridient = Nothing
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
