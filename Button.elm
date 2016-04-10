module Button (view) where

import QuizTypes
import Html exposing (Attribute, Html, button, text)
import Html.Attributes exposing (style)
import Html.Events


getStyle : String -> Attribute
getStyle backgroundColor =
  style
    [ ( "border", "0" )
    , ( "background-color", backgroundColor )
    , ( "color", "white" )
    , ( "font-size", "1.5rem" )
    , ( "margin-right", "1rem" )
    , ( "padding", "0.5rem 1rem" )
    ]


view : QuizTypes.ButtonTuple -> Signal.Address QuizTypes.Action -> QuizTypes.Action -> Html
view buttonTuple address action =
  button
    [ buttonTuple
        |> snd
        |> getStyle
    , Html.Events.onClick address action
    ]
    [ buttonTuple
        |> fst
        |> text
    ]
