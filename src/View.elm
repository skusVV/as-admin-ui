module View exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import State as App
import State exposing (Page)
import Messages exposing (Msg)

import Components.Tabs.View exposing (viewTabs)
import Authors.View exposing (viewAuthors)
import Recipies.View exposing (viewRecipies)
import Categories.View exposing (viewCategories)
import Ingridients.View exposing (viewIngridients)


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
                     Html.map Messages.Ingridients (viewIngridients model)
    in
    div [] [
        viewCurrentSection
    ]