module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes
import Html.Events


init =
    { csv = "Nom;prix;total\nLiquide de frein;10,99;56.72"
    }


type Message
    = UpdateCsv String


stringToTableColumn : String -> Html message
stringToTableColumn column =
    Html.th
        []
        [ Html.text column
        ]


lineToColumns : String -> List (Html message)
lineToColumns lines =
    lines
        |> String.split ";"
        |> List.map stringToTableColumn


headerFromCsv : String -> List (Html message)
headerFromCsv string =
    string
        |> String.lines
        |> List.head
        |> Maybe.map lineToColumns
        |> Maybe.withDefault []


update message model =
    case message of
        UpdateCsv csv ->
            { model | csv = csv }


view model =
    Html.div
        []
        [ Html.h1
            [ Html.Attributes.class "title"
            ]
            [ Html.text "CSV" ]
        , Html.textarea
            [ Html.Events.onInput UpdateCsv
            ]
            [ Html.text model.csv ]
        , Html.table
            []
            [ Html.thead
                []
                [ Html.tr
                    []
                    (headerFromCsv model.csv)
                ]
            ]
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
