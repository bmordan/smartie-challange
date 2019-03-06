import Browser
import Html exposing (Html, div, text, button, node)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Css exposing (..)
import Tachyons exposing (tachyonsStylesheet)
import Dict exposing (Dict)
import Array exposing (Array)

main =
    Browser.sandbox {init = init, update = update, view = view}

type alias Model =
    {smarties : List (String, Array Int)
    ,  counts : Dict String Int
    }

type alias Smartie =
    {index : Int
    , display : Bool}

tubeContent : Dict String Int
tubeContent = Dict.fromList [ 
      ("red", 3)
    , ("blue", 5)
    , ("yellow", 6)
    , ("orange", 4)
    , ("light-purple", 2)
    ]

makeStacks : String -> (String, Array Int)
makeStacks color =
    case Dict.get color tubeContent of
        Just val ->
            (color, Array.initialize val identity)
        Nothing ->
            ("red", Array.initialize 1 identity)

init : Model
init =
    {smarties = List.map makeStacks (Dict.keys tubeContent)
    , counts = tubeContent
    }

type Msg = Eat

decrement : Int -> Int
decrement count =
    let
        newCount = count - 1
    in
        if newCount < 0 then 0 else newCount

getCount : String -> Model -> Int
getCount key model =
    case Dict.get key model.counts of
        Just count ->
            decrement count
        Nothing ->
            0

-- getColor : List String -> String
-- getColor stack =
--     case stack.head of
--         Just smartID ->
--             List.split "|" smartID |> List.first |> Maybe.withDefault "red"

update : Msg -> Model -> Model
update msg model =
    case msg of
        Eat ->
          Debug.log "model" model

-- viewSmartie : String -> Html Msg
-- viewSmartie smartID =
--     let
--         smart_id = String.split "|" smartID
--         color = Maybe.withDefault "" (List.head smart_id)
--         strindex = Maybe.withDefault "" (List.reverse smart_id |> List.head)
--         index = Maybe.withDefault 0 (String.toInt strindex)
--     in
--         div [onClick (Eat (color, index)), class ("br-100 w3 h3 dib ma1 bg-" ++ color)] []
    

-- viewStack : (String, Array Int) -> Html Msg
-- viewStack (color, smarties) =
--     let
--         color = List.head stack
--         count = Dict.get
--     in
--         div [class "db flex items-center"] [
--             div [class "dib pr4 f2"] [text "boo"]
--             , div [class "dib"] (List.map viewSmartie stack)
--         ]

view : Model -> Html Msg
view model =
    div [class "flex flex-column items-center justify-center absolute top-0 bottom-0 right-0 left-0"]
        [ node "style" [] [ text tachyonsStylesheet ]
        , div [onClick Eat] [ text "BOO" ]
        ]

