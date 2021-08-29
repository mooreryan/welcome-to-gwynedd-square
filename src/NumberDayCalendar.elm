module NumberDayCalendar exposing
    ( NumberDay
    , numberDayFromTime
    , numberDayToString
    )

import Dict exposing (Dict)
import Time


type NumberDay
    = One
    | Two
    | Three
    | Four
    | None


numberDayFromTime : Time.Zone -> Time.Posix -> NumberDay
numberDayFromTime zone posix =
    case Dict.get (dateKey zone posix) numberDayCalendar of
        Just numberDay ->
            numberDay

        Nothing ->
            None



-- For winter: gwynedd-square-letter-days-a.svg
-- For spring: gwynedd-square-letter-days-a-spring.svg


numberDayToString : NumberDay -> String
numberDayToString numberDay =
    case numberDay of
        One ->
            "Cycle Day 1"

        Two ->
            "Cycle Day 2"

        Three ->
            "Cycle Day 3"

        Four ->
            "Cycle Day 4"

        None ->
            "We're off today!"



-- UTILS


{-| This is the format of the keys for the letter day calendar dict.
-}
dateKey : Time.Zone -> Time.Posix -> String
dateKey zone posix =
    let
        day =
            Time.toDay zone posix
                |> String.fromInt
                |> String.padLeft 2 '0'

        month =
            Time.toMonth zone posix
                |> toMonthNumber

        year =
            Time.toYear zone posix
                |> String.fromInt
    in
    -- E.g., 2020-10-20
    year ++ "-" ++ month ++ "-" ++ day


toMonthNumber : Time.Month -> String
toMonthNumber month =
    case month of
        Time.Jan ->
            "01"

        Time.Feb ->
            "02"

        Time.Mar ->
            "03"

        Time.Apr ->
            "04"

        Time.May ->
            "05"

        Time.Jun ->
            "06"

        Time.Jul ->
            "07"

        Time.Aug ->
            "08"

        Time.Sep ->
            "09"

        Time.Oct ->
            "10"

        Time.Nov ->
            "11"

        Time.Dec ->
            "12"


{-| DON'T EDIT DIRECTLY: Auto generated by the parse\_number\_day\_calendar.rb
script.
-}
numberDayCalendar : Dict String NumberDay
numberDayCalendar =
    Dict.fromList
        [ ( "2021-08-30", One )
        , ( "2021-08-31", Two )
        , ( "2021-09-01", Three )
        , ( "2021-09-02", Four )
        , ( "2021-09-07", One )
        , ( "2021-09-09", Two )
        , ( "2021-09-10", Three )
        , ( "2021-09-13", Four )
        , ( "2021-09-14", One )
        , ( "2021-09-15", Two )
        , ( "2021-09-17", Three )
        , ( "2021-09-20", Four )
        , ( "2021-09-21", One )
        , ( "2021-09-22", Two )
        , ( "2021-09-23", Three )
        , ( "2021-09-24", Four )
        , ( "2021-09-27", One )
        , ( "2021-09-28", Two )
        , ( "2021-09-29", Three )
        , ( "2021-09-30", Four )
        , ( "2021-10-01", One )
        , ( "2021-10-04", Two )
        , ( "2021-10-05", Three )
        , ( "2021-10-06", Four )
        , ( "2021-10-07", One )
        , ( "2021-10-08", Two )
        , ( "2021-10-11", Three )
        , ( "2021-10-12", Four )
        , ( "2021-10-13", One )
        , ( "2021-10-14", Two )
        , ( "2021-10-15", Three )
        , ( "2021-10-18", Four )
        , ( "2021-10-19", One )
        , ( "2021-10-20", Two )
        , ( "2021-10-21", Three )
        , ( "2021-10-22", Four )
        , ( "2021-10-25", One )
        , ( "2021-10-26", Two )
        , ( "2021-10-27", Three )
        , ( "2021-10-28", Four )
        , ( "2021-10-29", One )
        , ( "2021-11-01", Two )
        , ( "2021-11-03", Three )
        , ( "2021-11-05", Four )
        , ( "2021-11-08", One )
        , ( "2021-11-09", Two )
        , ( "2021-11-10", Three )
        , ( "2021-11-11", Four )
        , ( "2021-11-12", One )
        , ( "2021-11-15", Two )
        , ( "2021-11-16", Three )
        , ( "2021-11-17", Four )
        , ( "2021-11-18", One )
        , ( "2021-11-19", Two )
        , ( "2021-11-22", Three )
        , ( "2021-11-23", Four )
        , ( "2021-11-29", One )
        , ( "2021-11-30", Two )
        , ( "2021-12-01", Three )
        , ( "2021-12-02", Four )
        , ( "2021-12-03", One )
        , ( "2021-12-06", Two )
        , ( "2021-12-07", Three )
        , ( "2021-12-08", Four )
        , ( "2021-12-09", One )
        , ( "2021-12-10", Two )
        , ( "2021-12-13", Three )
        , ( "2021-12-14", Four )
        , ( "2021-12-15", One )
        , ( "2021-12-16", Two )
        , ( "2021-12-17", Three )
        , ( "2021-12-20", Four )
        , ( "2021-12-21", One )
        , ( "2021-12-22", Two )
        , ( "2021-12-23", Three )
        , ( "2022-01-03", Four )
        , ( "2022-01-04", One )
        , ( "2022-01-05", Two )
        , ( "2022-01-06", Three )
        , ( "2022-01-07", Four )
        , ( "2022-01-10", One )
        , ( "2022-01-11", Two )
        , ( "2022-01-12", Three )
        , ( "2022-01-13", Four )
        , ( "2022-01-14", One )
        , ( "2022-01-18", Two )
        , ( "2022-01-19", Three )
        , ( "2022-01-20", Four )
        , ( "2022-01-21", One )
        , ( "2022-01-24", Two )
        , ( "2022-01-25", Three )
        , ( "2022-01-26", Four )
        , ( "2022-01-27", One )
        , ( "2022-01-28", Two )
        , ( "2022-01-31", Three )
        , ( "2022-02-01", Four )
        , ( "2022-02-02", One )
        , ( "2022-02-03", Two )
        , ( "2022-02-04", Three )
        , ( "2022-02-07", Four )
        , ( "2022-02-08", One )
        , ( "2022-02-09", Two )
        , ( "2022-02-10", Three )
        , ( "2022-02-11", Four )
        , ( "2022-02-14", One )
        , ( "2022-02-15", Two )
        , ( "2022-02-16", Three )
        , ( "2022-02-17", Four )
        , ( "2022-02-22", One )
        , ( "2022-02-23", Two )
        , ( "2022-02-24", Three )
        , ( "2022-02-25", Four )
        , ( "2022-02-28", One )
        , ( "2022-03-01", Two )
        , ( "2022-03-02", Three )
        , ( "2022-03-03", Four )
        , ( "2022-03-04", One )
        , ( "2022-03-07", Two )
        , ( "2022-03-08", Three )
        , ( "2022-03-09", Four )
        , ( "2022-03-10", One )
        , ( "2022-03-11", Two )
        , ( "2022-03-14", Three )
        , ( "2022-03-15", Four )
        , ( "2022-03-16", One )
        , ( "2022-03-17", Two )
        , ( "2022-03-18", Three )
        , ( "2022-03-21", Four )
        , ( "2022-03-22", One )
        , ( "2022-03-23", Two )
        , ( "2022-03-24", Three )
        , ( "2022-03-25", Four )
        , ( "2022-03-28", One )
        , ( "2022-03-29", Two )
        , ( "2022-03-30", Three )
        , ( "2022-03-31", Four )
        , ( "2022-04-01", One )
        , ( "2022-04-04", Two )
        , ( "2022-04-05", Three )
        , ( "2022-04-06", Four )
        , ( "2022-04-07", One )
        , ( "2022-04-08", Two )
        , ( "2022-04-11", Three )
        , ( "2022-04-12", Four )
        , ( "2022-04-19", One )
        , ( "2022-04-20", Two )
        , ( "2022-04-21", Three )
        , ( "2022-04-22", Four )
        , ( "2022-04-25", One )
        , ( "2022-04-26", Two )
        , ( "2022-04-27", Three )
        , ( "2022-04-28", Four )
        , ( "2022-04-29", One )
        , ( "2022-05-02", Two )
        , ( "2022-05-04", Three )
        , ( "2022-05-05", Four )
        , ( "2022-05-06", One )
        , ( "2022-05-09", Two )
        , ( "2022-05-10", Three )
        , ( "2022-05-11", Four )
        , ( "2022-05-12", One )
        , ( "2022-05-13", Two )
        , ( "2022-05-16", Three )
        , ( "2022-05-18", Four )
        , ( "2022-05-19", One )
        , ( "2022-05-20", Two )
        , ( "2022-05-23", Three )
        , ( "2022-05-24", Four )
        , ( "2022-05-25", One )
        , ( "2022-05-26", Two )
        , ( "2022-05-27", Three )
        , ( "2022-05-31", Four )
        ]
