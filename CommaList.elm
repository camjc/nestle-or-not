module CommaList (view) where

import QuizTypes
import Array
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import String
import String.Addons


whitespaceToNbsp : String -> String
whitespaceToNbsp string =
  String.Addons.replace " " "\xA0" string


getListString : QuizTypes.Answers -> String
getListString array =
  array
    |> Array.map .label
    |> Array.map whitespaceToNbsp
    |> Array.toList
    |> String.join ", "


view : QuizTypes.Answers -> QuizTypes.ButtonTuple -> Html
view listOfLabels buttonTuple =
  if Array.isEmpty listOfLabels then
    div [] []
  else
    div
      [ style
          [ ( "color", (snd buttonTuple) )
          , ( "line-height", "1.6" )
          , ( "margin-top", "0.5rem" )
          ]
      ]
      [ text ((fst buttonTuple) ++ ": " ++ (getListString listOfLabels) ++ ".") ]
