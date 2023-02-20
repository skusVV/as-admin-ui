module View exposing (..)

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import State as App
import Messages exposing (Msg)
import Components.Tabs.View exposing (viewTabs)
import Authors.View exposing (viewAuthors)
import Recipies.View exposing (viewRecipies)
import Categories.View exposing (viewCategories)
import Ingridients.View exposing (viewIngridients)
import State exposing (Page)

view : App.State -> Html Msg
view model =
    let
        pages = 
            model.pages
        selectedPage =
            model.selectedPage
    in
    
    div [ class "container"]
        [ viewTabs pages selectedPage
        , viewSection model selectedPage
        ]

viewSection : App.State -> Page -> Html Msg
viewSection model currentSelectedPage =
    let 
        viewCurrentSection = 
            case currentSelectedPage of
                State.Authors _ ->
                    viewAuthors

                State.Recipies _ ->
                    viewRecipies
                
                State.Categories _ ->
                    viewCategories

                State.Ingridients _ ->
                    viewIngridients model
    in
    div [] [
        viewCurrentSection
    ]