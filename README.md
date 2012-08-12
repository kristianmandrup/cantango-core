# CanTango Core

Core functionality for [CanTango](https://github.com/kristianmandrup/cantango)

Core should not have dependencies to any other CanTango components but should stand on its own. All other CanTango components can rely on core for "core" functionality :)

## Status: Aug 2012

The *core* CanTango component is under development with specs:
Current status:

`71 examples, 22 failures`

Please help out if you like the ideas behind this project ;)

## Installation

CanTango has been tested to work with _Ruby 1.9+_ and currently doesn't support _Ruby 1.8.7_
If you require ruby 1.8.7 support, please help patch it and make a pull request ;)

### Install in Ruby environment (or gem set)

`gem install cantango-core`

## Install in Rails application

Insert into Gemfile of your Rails application:

`gem 'cantango-core'`

If you want to live on the edge and use the latest master branch, use the `:git` option. To designate a specific branch, use the `:branch` option. You can also clone this project and reference your local copy (easier to debug/fix) by using the `:path` option (see *Bundler* documentation).

Run bundler in a terminal/console from the folder of your Gemfile (root folder of the app)

`$ bundle`

## CanTango core extensions

The following CanTango components extend core:

* [Cantango core](https://github.com/kristianmandrup/cantango-core)
* [Cantango config](https://github.com/kristianmandrup/cantango-config)
* [Cantango cache](https://github.com/kristianmandrup/cantango-cache)
* [Cantango model](https://github.com/kristianmandrup/cantango-model)
* [Cantango masquerade](https://github.com/kristianmandrup/cantango-masquerade)
* [Cantango roles](https://github.com/kristianmandrup/cantango-roles)


## Extending core

To extend core, you should follow the CanTango extension conventions. We will demonstrate these conventions using the _-api_ extension as an example. The extension file structure should look like this:

```text
/cantango
  /api
  /api_ext
  api.rb
  api_ext.rb_
```

The main API logic should go in the `cantango/api` folder. Extensions to core go into the `cantango/api_ext` folder. The extensions should use the same folder structure as core if possible.

## Contributing to cantango-core
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Kristian Mandrup. See LICENSE.txt for
further details.

