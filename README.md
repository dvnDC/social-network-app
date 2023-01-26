## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ gem install bundler -v 2.4.5
$ bundle _2.4.5_ config set --local without 'production'
$ bundle _2.4.5_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```