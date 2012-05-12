Temporal Object
===============

This is an implementation of Martin Fowler's [Temporal Object Pattern](http://martinfowler.com/eaaDev/TemporalObject.html).

It uses abstract time (as implemented by the time_span gem).  If you would rather use standard Earth time, you might look into the [runt gem](http://runt.rubyforge.org/).

This gem is implemented as a mixin, so that you can do the following:

```ruby
require 'temporal_object'
include TemporalObject
```

Will add instance methods to manipulate TimeLines (and thereby TimeSpans and RelativeTimes) to the including object.


Most of the temporal aspects for Temporal Object are delegated to TimeSpan.  The Temporal Object just has any number of
TimeSpan statuses.

 More information on TimeSpan:

* [rdoc] (http://rubydoc.info/gems/time_span/0.1.6/frames)
* [github] (https://github.com/coyote/time_span)
* [rubygems] (https://rubygems.org/gems/time_span)

Note: this implementation is quite changed from gem version 0.0.3, where TemporalObjects needed to be created, which pointed to your actual object.  Code has been simplified thereby, and is much cleaner.

[![endorse](http://api.coderwall.com/coyote/endorsecount.png)](http://coderwall.com/coyote)
