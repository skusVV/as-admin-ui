module State exposing (..)

type alias Model =
    {   pages: List String
    ,   selectedPage: String
    }

defaultModel : Model
defaultModel =
    {   pages = ["Authors", "Recipies", "Categories"]
    ,   selectedPage = "Authors"
    }