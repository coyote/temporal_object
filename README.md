Temporal Object
===============

This gem is implemented as a mixin, so that you can do the following:

```ruby
require 'temporal_object'
include TemporalObject
```

Will add instance methods to manipulate TimeLines (and thereby TimeSpans and RelativeTimes) to the including object.


Most of the temporal aspects for Temporal Object are delegated to TimeSpan.  The Temporal Object just has any number of
TimeSpan statuses.

 More information on TimeSpan:

* [rdoc] (http://rubydoc.info/gems/time_span/0.0.3/frames)
* [github] (https://github.com/coyote/time_span)
* [rubygems] (https://rubygems.org/gems/time_span)


Note, that this implementation is quite changed from gem version 0.0.3, where TemporalObjects needed to be created, which pointed to your actual object.  Code has been simplified thereby, and is much cleaner.
