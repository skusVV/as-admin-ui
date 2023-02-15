module View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import State exposing (Model)
import Messages exposing (Msg)
import Components.Tabs.View exposing (viewTabs)
import Authors.View exposing (viewAuthors)
import Recipies.View exposing (viewRecipies)
import Categories.View exposing (viewCategories)


view : Model -> Html Msg
view model =
    let
        pages = 
            model.pages
        selectedPage =
            model.selectedPage
    in
    
    div [ class "container"]
        [ viewTabs pages selectedPage
        , viewSection selectedPage
        ]

viewSection : String -> Html Msg
viewSection currentSelectedPage =
    let 
        viewCurrentSection = 
            if currentSelectedPage == "Authors" then viewAuthors
            else if currentSelectedPage == "Recipies" then viewRecipies
            else viewCategories
    in
    div [] [
        viewCurrentSection
    ]