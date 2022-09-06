module Forms exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Events exposing (onInput)
import Html.Attributes exposing (..)

main: Program () Model Message

main =
  Browser.sandbox {
    init = init,
    update = update,
    view = view
  }

type alias Model = {
    name: String,
    password: String,
    passwordAgain: String
  }

init: Model

init = 
  {
    name = "",
    password = "",
    passwordAgain = ""
  }

type Message =
  Name String
  | Password String
  | PasswordAgain String

update: Message -> Model -> Model

update message model =
  case message of
    Name name -> { model | name = name }
    Password password -> { model | password = password }
    PasswordAgain password -> { model | passwordAgain = password }

view: Model -> Html Message

view model =
  div [] [
    viewInput "text" "Name" model.name Name,
    viewInput "password" "Password" model.password Password,
    viewInput "password" "Password again" model.passwordAgain PasswordAgain,
    viewValidation model
  ]

viewInput: String -> String -> String -> (String -> msg) -> Html msg

viewInput inputType placeholder_ value_ onMessage =
  input [type_ inputType, placeholder placeholder_, onInput onMessage, value value_] []

viewValidation: Model -> Html Message

viewValidation model =
  if model.password == model.passwordAgain then
    div [style "color" "green"] [text "OK"]
  else
    div [style "color" "red"] [text "Passwords do not match"]
