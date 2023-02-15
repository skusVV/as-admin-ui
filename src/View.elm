module View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import State exposing (Model)
import Messages exposing (Msg)
import Components.Tabs.View exposing (viewTabs)
import Authors.View exposing (viewAuthors)
import Recipies.View exposing (viewRecipies)
import Categories.View exposing (viewCategories)
import State exposing (Page)


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

viewSection : Page -> Html Msg
viewSection currentSelectedPage =
    let 
        viewCurrentSection = 
            case currentSelectedPage of
                State.Authors _ ->
                    viewAuthors

                State.Recipies _ ->
                    viewRecipies
                
                State.Categories _ ->
                    viewCategories
    in
    div [] [
        viewCurrentSection
    ]