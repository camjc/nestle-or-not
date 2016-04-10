module Quiz (update, view) where

import Button
import Helpers
import ScoreCard
import EndMessage
import Question
import Array
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)


-- MODEL

import QuizTypes


-- UPDATE


getCurrentQuestion : QuizTypes.Model -> QuizTypes.Answer
getCurrentQuestion model =
  case Array.get model.questionId model.questions of
    Just question ->
      { id = model.questionId, value = (fst question), label = (snd question) }

    Nothing ->
      { id = -1, value = False, label = "End" }


isGuessCorrect : QuizTypes.Model -> Bool -> Bool
isGuessCorrect model guess =
  (getCurrentQuestion model).value == guess


updateModelWithGuess : Bool -> QuizTypes.Model -> QuizTypes.Model
updateModelWithGuess guess model =
  let
    correctGuess =
      (isGuessCorrect model guess)

    currentQuestion =
      getCurrentQuestion model
  in
    { model
      | questionId = model.questionId + 1
      , correctAnswers =
          if correctGuess then
            Array.push currentQuestion model.correctAnswers
          else
            model.correctAnswers
      , wrongAnswers =
          if (not correctGuess) then
            Array.push currentQuestion model.wrongAnswers
          else
            model.wrongAnswers
    }


update : QuizTypes.Action -> QuizTypes.Model -> QuizTypes.Model
update action model =
  case action of
    QuizTypes.Start ->
      { model | questionId = 0 }

    QuizTypes.GuessTrue ->
      updateModelWithGuess True model

    QuizTypes.GuessFalse ->
      updateModelWithGuess False model



-- VIEW


view : Signal.Address QuizTypes.Action -> QuizTypes.Model -> Html
view address model =
  div
    [ style
        [ ( "margin", "5rem auto" )
        , ( "max-width", "25rem" )
        ]
    ]
    (if model.questionId == -1 then
      [ model.instructionsComponent
      , Button.view ( "Start", "green" ) address QuizTypes.Start
      ]
     else if (getCurrentQuestion model).label == "End" then
      [ EndMessage.view (Helpers.getPercentageCorrect model)
      , ScoreCard.view model
      ]
     else
      [ Question.view (getCurrentQuestion model)
      , Button.view model.buttonTrue address QuizTypes.GuessTrue
      , Button.view model.buttonFalse address QuizTypes.GuessFalse
      , ScoreCard.view model
      ]
    )
