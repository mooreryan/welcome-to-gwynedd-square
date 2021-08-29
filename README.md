# "Welcome to Gwynedd Square" App Source Code

Source code for the Welcome to Gwynedd Square app.

## Generate the LetterDayCalendar data

- Get the letter day calendar data from the Google Doc.
- Run the `./scripts/parse_letter_day_calendar.rb` script on the `letter_day_calendar.tsv` data from the Google doc.
- Take the generated Elm code and put it in the `./src/LetterDayCalendar.elm` file as the `letterDayCalendar`.

Something like this:

```
$ ruby scripts/parse_number_day_calendar.rb _ryan/number_day_calendar.tsv > number_day_calendar.txt
```

## Start dev server

```
npm run start
```

## Publish to Netlify

See [here](https://github.com/halfzebra/create-elm-app/blob/1a4e2ef9b2133b3ed8cb053101644bb8bc4bcd31/template/README.md#netlify) for more info.

### Step 1: `npm install --save-dev create-elm-app`

Since netlify runs the build step on their server we need to install create-elm-app.

### Step 2: Go to the netlify settings and set the publish directory to `build` and the build command to `npm run build`

This step is important to make sure netlify uses the correct build command.