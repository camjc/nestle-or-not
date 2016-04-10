module Question (view) where

import QuizTypes
import Html exposing (Html, h1, text)


view : QuizTypes.Answer -> Html
view question =
  h1
    []
    [ question
        |> .label
        |> text
    ]
