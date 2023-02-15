module State exposing (..)

type Page
    = Authors
    | Recipies
    | Categories

type alias Model =
    {   pages: List String
    ,   selectedPage: Page
    }

defaultModel : Model
defaultModel =
    {   pages = ["Authors", "Recipies", "Categories"]
    ,   selectedPage = Authors
    }