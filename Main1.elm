-- below is an application that responds to user interaction using messages


module Main1 exposing (..)

import Html exposing (Html, button, div, program, text)
import Html.Events exposing (onClick)


--MODEL


type alias Model =
    Bool


init : ( Model, Cmd Msg )
init =
    ( False, Cmd.none )



--MESSAGES


type Msg
    = Expand
    | Collapse



--VIEW
-- Expand and Collapse are both of type Msg


view : Model -> Html Msg
view model =
    if model then
        div []
            [ button [ onClick Collapse ] [ text "Collapse" ]
            , text "Widget"
            ]
    else
        div []
            [ button [ onClick Expand ] [ text "Expand" ] ]



--UPDATE
-- update responds to the possible messages and in this case changes the state
-- when the message is "Expand" the new state will be true


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Expand ->
            ( True, Cmd.none )

        Collapse ->
            ( False, Cmd.none )



--SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--MAIN


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
