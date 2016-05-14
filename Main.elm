module Main exposing (main)

import QuizTypes
import Quiz exposing (update, view)
import Array
import Html exposing (Html)
import Html.App exposing (beginnerProgram)
import Markdown
import Random
-- import Random.Array


-- True is Nestle, False is Other.
-- I haven't vetted the practices of all other examples yet,
-- but just list the main competitor to each Nestle product.


questions : List QuizTypes.Question
questions =
  [ ( True, "Aero" )
  , ( False, "Mars Bar" )
  , ( True, "Allens" )
  , ( False, "Cadbury" )
  , ( True, "Uncle Tobys" )
  , ( False, "Weet-Bix" )
  , ( True, "Cheerios" )
  , ( False, "Kellogg's Corn Flakes" )
  , ( True, "Quick-eze" )
  , ( False, "Rennie" )
  , ( True, "Butter Menthols" )
  , ( False, "Fisherman's Friend" )
    -- , ( True, "Butterfinger" )
    -- , ( False, "Clark Bar" )
  , ( True, "Crunch" )
  , ( False, "Krackel" )
  , ( True, "Fancy Feast" )
  , ( True, "Friskies" )
  , ( False, "Whiskas" )
  , ( False, "Purina" )
  , ( True, "Gerber (Baby Formula)" )
  , ( False, "Enfamil (Baby Formula)" )
  , ( True, "Häagen-Dazs" )
  , ( False, "Ben and Jerry" )
    -- , ( True, "Hot Pockets" )
    -- , ( False, "Pizza Rolls" )
  , ( True, "Kit Kat" )
  , ( False, "Snickers" )
  , ( True, "Lean Cuisine" )
  , ( False, "Weight Watchers" )
  , ( True, "Maggi" )
  , ( False, "Top Ramen" )
  , ( True, "Milo" )
  , ( False, "Moove" )
  , ( True, "Mövenpick" )
  , ( False, "Baskin Robbins" )
  , ( True, "Nescafé" )
  , ( False, "Starbucks" )
  , ( True, "Nespresso" )
  , ( False, "Illy" )
  , ( True, "Nesquick" )
  , ( False, "Ovaltine" )
  , ( True, "Perrier" )
  , ( False, "Evian" )
  , ( True, "San Pellegrino" )
  , ( False, "Cool Ridge" )
  , ( True, "Smarties" )
  , ( False, "M&Ms" )
  , ( True, "Nerds" )
  , ( False, "Skittles" )
  , ( True, "Wonka" )
  , ( False, "Hersheys" )
  ]


shuffleListToArray : List ( Bool, String ) -> Array.Array QuizTypes.Question
shuffleListToArray list =
  (Array.fromList list)
  -- fst
  --   (Random.Array.shuffle
  --     (Random.initialSeed 204862737)
  --     (Array.fromList list)
  --   )


instructionsComponent : Html QuizTypes.Msg
instructionsComponent =
  Markdown.toHtml [] """

# Nestle or Not

## Reasons I wanted to learn what products Nestle makes

  - [Alleged child slavery](https://www.rt.com/usa/328682-child-slavery-scotus-nestle/)
  - [Alleged water crisis profiteering](https://www.salon.com/2015/04/07/nestles_despicable_water_crisis_profiteering_how_its_making_a_killing_%E2%80%94%C2%A0while_california_is_dying_of_thirst/)
  - [Discouraging breast feeding](http://www.theguardian.com/sustainable-business/nestle-baby-milk-scandal-food-industry-standards)

## How to Play

  - A product name will appear.
  - Click *Nestle* if you think they made it.
  - Click *Other* if you think they didn't.

"""

model =
    { questionId =
        -1
        -- Show Instructions
    , questions = shuffleListToArray questions
    , correctAnswers = Array.empty
    , wrongAnswers = Array.empty
    , buttonTrue = ( "Nestle", "#005a97" )
    , buttonFalse = ( "Other", "#00975a" )
    , instructionsComponent = instructionsComponent
    }

main =
  Html.App.beginnerProgram { model = model, view = view, update = update }
-- main =
--   Html.App.beginnerProgram
--     { model =
--         { questionId =
--             -1
--             -- Show Instructions
--         , questions = shuffleListToArray questions
--         , correctAnswers = Array.empty
--         , wrongAnswers = Array.empty
--         , buttonTrue = ( "Nestle", "#005a97" )
--         , buttonFalse = ( "Other", "#00975a" )
--         , instructionsComponent = instructionsComponent
--         }
--     , update = update
--     , view = view
--     }
--  -> Program Never
