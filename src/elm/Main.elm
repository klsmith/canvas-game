module Main exposing (..)

import Browser
import Canvas exposing (..)
import Canvas.Settings exposing (..)
import Color
import Html exposing (Html)
import Html.Attributes exposing (style)



-- MAIN


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- MODEL


type Model
    = NoModel



-- MSG


type Msg
    = NoMsg



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( NoModel, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



--VIEW


view : Model -> Html Msg
view model =
    let
        width =
            640

        height =
            480
    in
    Html.div []
        [ Html.div [] [ Html.text "Hello World 4" ]
        , Canvas.toHtml ( 640, 480 )
            []
            [ shapes [ fill Color.white ] [ rect ( 0, 0 ) width height ]
            , renderSquare
            ]
        ]


renderSquare =
    shapes [ fill (Color.rgba 0 0 0 1) ]
        [ rect ( 0, 0 ) 100 50 ]
