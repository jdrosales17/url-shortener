# URL Shortener

This application provides a URL shortener service and also serves as a link management system.

In order to run the app you need to install:

- Ruby 3.0.0
- Bundler (for that version of Ruby)
- Yarn
- Node
- Postgres (if you are on Mac, Postgres.app is great)

Once that is done, clone the repo and in the app's root directory run the following commands:

```sh
bundle install
rake db:setup
bundle exec rails s
```

Finally, open your browser and go to `localhost:3000`.
