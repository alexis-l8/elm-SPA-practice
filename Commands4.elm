--


module Commands4 exposing (..)

import Html exposing (Html, button, div, program, text)
import Html.Events exposing (onClick)
import Random


-- MODEL


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 1, Cmd.none )



-- MESSAGES


type Msg
    = Roll
    | OnResult Int



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ]
        , text (toString model)
        ]



-- UPDATE
-- the pattern below is known as parameterized types


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            -- Roll is for rolling a new number
            ( model, Random.generate OnResult (Random.int 1 6) )

        -- Random.generate creates a command that will generate random numbers
        -- Random.generate requires the first argument to be a constructor for the message that will be fed back, in this case it's OnResult
        -- When the command is run, Elm calls OnResult with the random number, e.g. OnResult 2
        -- Html.program then feeds this back to the application
        OnResult res ->
            -- Onresult gets a generated number from the "Random" library
            -- OnResult will contain the payload, the integer "res" in this case
            ( res, Cmd.none )



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
