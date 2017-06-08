-- the example below illustrates how we use subscriptions to listen for external input:
-- keyboard, mouse, websockets, browser location changes


module Main exposing (..)

import Html exposing (Html, div, program, text)
import Keyboard
import Mouse


-- MODEL


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- MESSAGES


type Msg
    = MouseMsg Mouse.Position
    | KeyMsg Keyboard.KeyCode



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (toString model) ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMsg position ->
            ( model + 1, Cmd.none )

        KeyMsg code ->
            ( model + 2, Cmd.none )



-- SUBSCRIPTIONS
-- here we declare the things we want to listen to; in this case: mouse.clicks and keyboard.downs
-- both these functions take a message constructor and return a subscription


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        -- sub.batch listens to both mouse.clicks and keyboard.downs
        -- batch takes a list of subscription and returns one subscription which includes them all. (Dunno what this means)
        [ Mouse.clicks MouseMsg
        , Keyboard.downs KeyMsg
        ]



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
