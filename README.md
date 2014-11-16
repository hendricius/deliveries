# Boilerplate Rails app

Just another boilerplate rails app. Comes preconfigured with several aweseome gems to make building UIs a lot easier.

* Setup for .rbenv
* Capistrano for deployment

The UI gems include:

* Boostrap
* Bourbon
* Font Awesome

On top of that `guard` is included. Together with the [http://livereload.com/](http://livereload.com/) browser extension the app can automatically reload whenever you change stuff in the UI.

For tests `minitest` is set as the default test engine.

# Setup

1. Clone the whole repo.
2. `bundle install` in the root folder.
3. `cp config/database.yml.example config/database.yml`
4. `vim config/database.yml` and fill your database credentials.
