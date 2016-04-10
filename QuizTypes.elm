module QuizTypes (..) where

import Array
import Html


type alias Question =
  ( Bool, String )


type alias Answer =
  { id : Int, label : String, value : Bool }


type alias Answers =
  Array.Array Answer


type alias ButtonTuple =
  ( String, String )


type alias Model =
  { questionId : Int
  , questions : Array.Array Question
  , correctAnswers : Answers
  , wrongAnswers : Answers
  , buttonTrue : ButtonTuple
  , buttonFalse : ButtonTuple
  , instructionsComponent : Html.Html
  }


type Action
  = Start
  | GuessTrue
  | GuessFalse
