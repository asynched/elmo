module Buttons exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main: Program () Model Message

main =
  Browser.sandbox {
    init = init,
    update = update,
    view = view
  }

type alias Model = Int

init: Model
init = 0

type Message =
  Increment
  | Decrement

update: Message -> Model -> Model

update message model =
  case message of
    Increment -> model + 1
    Decrement -> model - 1

view: Model -> Html Message

view model =
  div [] [
    button [onClick Decrement] [text "-"],
    div [] [text (model |> String.fromInt)],
    button [onClick Increment] [text "+"]
  ]
