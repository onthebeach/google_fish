google_fish
========

A tiny gem that makes using Google Translate v2 API trivial.

Getting started
---------------

    gem install google_fish

You'll also need an API key from here [ http://code.google.com/apis/language/translate/v2/getting_started.html](http://code.google.com/apis/language/translate/v2/getting_started.html)

    google = GoogleFish.new('my-api-key')
    google.translate(:en, :es, 'hi')
    # => 'hola'
    google.translate(:en, :es, '<p>hi</p>', :html => true)
    # => '<p> hola </p>'


Contributing to google_fish
---------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright &copy; 2011 On The Beach Ltd. See LICENSE.txt for
further details.

