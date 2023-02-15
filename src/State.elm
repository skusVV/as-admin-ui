module State exposing (..)

type Page = 
    Authors String
    | Recipies String
    | Categories String   

pageToString : Page -> String
pageToString page =
  case page of
    Authors label ->
      label

    Recipies label ->
      label
      
    Categories label ->
      label


type alias Model =
    {   pages: List Page
    ,   selectedPage: Page
    }

defaultModel : Model
defaultModel =
    {   pages = [Authors "Authors", Recipies "Recipies", Categories "Categories"]
    ,   selectedPage = Authors "Authors"
    }