#require "temporal_object/version"

module TemporalObject

  require 'date'

  # write specs for this
  class TimeSpanRelation

    # for RrelativeTimeSpan objects a,b:

    #  a is before b (gap between)
    #  a is after b  (gap between)

    # a starting as b ending (before and touching))
    # a ending as b starting (after and touching)

    #  a starting with but ending before b
    #  a starting with but ending after b

    #  a == b

    #  a starting after but ending before b
    #  a starting after but ending with b
    #  a starting after but ending after b

    #  a starting before but ending after b
    #  a starting after and ending before b

    # a starting before b and ending before b
    # a starting after and ending after b

    # a starting after b but ending with b
    # a starting before but ending with b


  end


  class RelativeTimeSpan

    attr_accessor :starting, :ending     # RelativeTime objects


    def starting_before?(b)   #+1
      starting < b.starting
    end

    def starting_after?(b)     #-2
      starting > b.starting
    end

    def starting_with?(b)      #-3
      starting == b.starting
    end

    def ending_before?(b)      #-5
      ending < b.ending
    end

    def ending_after?(b)     #-6
      ending > b.ending
    end

    def ending_with?(b)        #+4
      ending == b.ending
    end

    def ending_before_other_starting?(b)    #-7
      ending < b.starting
    end

    def ending_as_other_starting?(b)       #-8
      ending == b.starting
    end

    def starting_after_other_ending?(b)     #-9
      starting > b.ending
    end

    def starting_as_other_ending?(b)       #-10
      starting == b.ending
    end

  end

  # first implementation is just as DateTime; later add fuzzy  time
  class RelativeTime  < DateTime
  end



end
