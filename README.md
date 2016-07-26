# Abgaben

Abgaben für [Rubies in the Woods](https://www.meetup.com/de-DE/Rubies-in-The-Woods-Die-Coding-Learners-Group-fur-Frauen/).

## /railsgirls

![Screenshot](/railsgirls/app/assets/images/screenshot_index.png?raw=true "Screenshot der Startseite")

Ruby on Rails-Webapp basierend auf dem [Rails Girls Workshop Tutorial](http://guides.railsgirls.com/app), mit eigenen Ergänzungen. Benutzt Rspec für Behavior-Driven Development.

### Installation

Clone repository:

`git clone https://github.com/veracl/abgaben.git`

Change into directory and install gems:

`cd abgaben/railsgirls`

`bundle install`

### Run the app

Run migrations and seed the database:

`bundle exec rake db:migrate`

`bundle exec rake db:seed`

Start the server:

`bundle exec rails server`

**Done!** Open your browser and check it out. You can now make your own changes. Reset the database at any time with:

`bundle exec rake db:reset`

----

## /todoliste

Eine simple To-Do-Liste mit SQLite3 Datenbank.

----

## /sinatra-templates

Übungsaufgabe zu Templates in Sinatra.
