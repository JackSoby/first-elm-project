module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (value)

--main function
main =
    Html.beginnerProgram { view = view
                        , model = model
                        , update = update
                        }


type alias Model =
  { input: String
  , todos: List String
  }


model : Model
model =
    { input = ""
    , todos = []
    }

type Msg
    = AddTodo
    | HandleTextInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTodo ->
          { model | input = "", todos = model.input :: model.todos }
        HandleTextInput nextInput ->
          {model | input = nextInput }


view : Model -> Html Msg
view model =
  let
    renderedTodos = model.todos
      |> List.map (\todo -> div [] [text todo])
  in
    div []
        [ form [ ] [
          input [ onInput HandleTextInput, value model.input ] []
          , div [ onClick AddTodo ] [text "Add Todo"]
        ],
         div [] renderedTodos
        ]
