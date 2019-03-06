import Browser
import Html exposing (Html, div, text, button, node, a)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, href)
import Css exposing (..)
import Tachyons exposing (tachyonsStylesheet)
import Dict exposing (Dict)
import Array exposing (Array)

main =
    Browser.sandbox {init = init, update = update, view = view}

type alias Model =
    {smarties : List (String, Array Bool)
    ,  counts : Dict String Int
    }

tubeContent : Dict String Int
tubeContent = Dict.fromList [ 
      ("red", 3)
    , ("blue", 5)
    , ("yellow", 6)
    , ("orange", 4)
    , ("light-purple", 2)
    ]

makeStacks : String -> (String, Array Bool)
makeStacks color =
    case Dict.get color tubeContent of
        Just val ->
            (color, Array.initialize val (always True))
        Nothing ->
            ("red", Array.initialize 0 (always False))

init : Model
init =
    {smarties = List.map makeStacks (Dict.keys tubeContent)
    , counts = tubeContent
    }

type Msg = Eat String Int

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

eatSmartie : String -> Int -> (String, Array Bool) -> (String, Array Bool)
eatSmartie updateColor index (color, stack) =
    if updateColor == color then
        (color, (Array.set index False stack))
    else
        (color, stack)

update : Msg -> Model -> Model
update msg model =
    case msg of
        Eat color index ->
            let
                count = getCount color model
                counts = Dict.insert color count model.counts
                smarties = List.map (eatSmartie color index) model.smarties
            in
                Model smarties counts
                

getCountForColor : Dict String Int -> String -> Int
getCountForColor counts key =
    case Dict.get key counts of
        Just count -> count
        Nothing -> 0

viewSmartie : String -> (Int, Bool) -> Html Msg
viewSmartie color (index, display) =
    let
        bg = if display then color else "transparent"
    in
        div [onClick (Eat color index), class ("br-100 w3 h3 dib ma1 bg-" ++ bg)][]

viewSmarties : String -> List (Int, Bool) -> List (Html Msg)
viewSmarties color stack =
    List.map (viewSmartie color) stack

viewStack : Dict String Int -> (String, Array Bool) -> Html Msg
viewStack counts (color, stack) =
    let
        countInt = (getCountForColor counts color)
        countStr = if countInt == 0 then "" else String.fromInt countInt
    in    
        div [class "db flex items-center"][
            div [class "dib pr4 f2"][text countStr]
        ,   div [class "dib"] (Array.toIndexedList stack |> (viewSmarties color))
        ]

view : Model -> Html Msg
view model =
    div [class "flex flex-column items-center justify-center absolute top-0 bottom-0 right-0 left-0"]
        [ node "style" [] [ text tachyonsStylesheet ]
        , div [class "mw9"][
            div [class "tl f1 pb4 w-100"] [text "The Smartie Challange"]
            , div [] (List.map (viewStack model.counts) model.smarties)
            , div [class "pt5 tl w-100"][
                a[href "//github.com/bmordan/smartie-challange", class "link"][text "read more about this software challange on github"]
            ]
        ]
        ]

