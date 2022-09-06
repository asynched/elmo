module TextFields exposing (main)

import Browser
import Html exposing (Html, div, input, h1, p, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main: Program () Model Message

main =
  Browser.sandbox {
    init = init,
    update = update,
    view = view
  }


type alias Model =
  {
    content: String
  }

init: Model

init =
  { content = "racecar" }

type Message =
  Change String

update: Message -> Model -> Model

update message model =
  case message of
    Change content ->
      { model | content = content }

view: Model -> Html Message

view model =
  div [] [
    h1 [] [text "Type something down below!"],
    input [placeholder "Text to reverse", value model.content, onInput Change] [],
    div [] [
      p [] [text ("You've typed: " ++ model.content)],
      p [] [text ("The text in reverse is: " ++ String.reverse model.content)]
    ]
  ]
