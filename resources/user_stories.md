BEERICA: an app for tracking the state of breweries per state

Beerica is a web application for tracking the number and location of breweries across the United States.
It will allow users to look up a list of breweries by state, get information for each brewery, and see where
the brewery is located.


User Stories

---
As a user
I would like to see a map of the United States with breweries per capita
So I can see which state loves beer the most

Acceptance criteria:
[x] Visiting the homepage reveals a map of the US, color-coded by breweries per capita.
[ ] The app should give users a clear understanding of what they are looking at (key, etc.)

---
As a user
I would like to select a state
So I can see a list of all the breweries in that state

Acceptance criteria:
[x] A user can visit a state and be brought to a state info page
[x] The state page includes links to all breweries in the state
[x] A user can click on a brewery and get information on the brewery
[x] The state page includes a Google map for the state, with all brewery locations marked
[x] A user can look up a town and see all of the breweries in that city
[ ] A state page includes stats on the breweries in that state
[ ] A user can search for a brewery near a specific location
[ ] A user can search for a brewery near their current location

As a user
I would like to search for a brewery by name
So that I can look up its information quickly
Acceptance criteria:
[ ] A user can visit the search page, look up a brewery and get to the brewery's page


---
As a user
I would like to see where a brewery is located
So I can visit it

Acceptance criteria:
[x] A user can visit a brewery page and see a map showing the exact location of the brewery
[ ] A user can see a picture of a brewery if one is available
[x] A user can visit a brewery's website if one is available
[ ] If a location is not available, the user will see a message

---
As a beer nut
I would like to add information to the database
So that I can give beer drinkers better info

Acceptance criteria:
[ ] A user can add a new brewery to the database
[ ] A user will get an error message if the brewery is already loaded
[ ] A user can add new information to a brewery page

---
As Brewery DB
I would like to have my API listed on Beerica
So it will abide by my terms of use

Acceptance criteria:
[x] Brewery DB is mentioned in the info page
[ ] Brewery DB is featured in a footer

---
As a user
I would like to navigate the top bar of Beerica
So I can easily get around the website

Acceptance criteria:
[x] The home page link returns the user to the state index page
[ ] The search link brings the user to a search for breweries page
[ ] The share link lets the user share Beerica via Twitter and Facebook
[x] The info page link brings the user to an info page
