module App exposing (..)

import Html exposing (Html, div, program, text)


-- MODEL


type alias Model =
    String



-- this init function provides the initial input for the application
-- therefore Html.program expects a tuple with (model, command)
-- "model" in this tuple is our initial state and the second element is the initial command to run


init : ( Model, Cmd Msg )
init =
    ( "Hello", Cmd.none )



--MESSAGES
-- messages are things that happen in the app that components react and change to.
-- "NoOp" is our only message which currently in the application is doing nothing


type Msg
    = NoOp



--VIEW
-- the view function renders an HTML element using the application model


view :
    Model
    -> Html Msg -- Html Msg means that this HTMl element produces messages
view model =
    div []
        [ text model ]



-- UPDATE
-- update is called by Html.program each time a message is received
-- the update function responds to messages to update the model and returns commands


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            -- here the function responds to NoOp with the unchanged model and no command
            ( model, Cmd.none )



--SUBSCRIPTIONS
-- subscriptions are used to listen for external input: mouse movements, keyboard events, browser location changes


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--MAIN
--Html.program finally wires everything together to return an Html element to render onto the page


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
