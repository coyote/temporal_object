#require "temporal_object/version"

module TemporalObject

  require 'date'                      # to be deprecated

  class TemporalStatusItem           # detail record

    def initialize( status )
    end

    def status_entry
    end

    # no replace/edit functionality, remve from TemporalStatusList, and reinsert

  end

  class TemporalStatusHistory     # a list of TemporalStatusEntries

    def initialize( name )
    end

  end

  class TemporalStatusGroup        # a hash where key is category, values are

     def initialize( name )
     end



  end

  class TemporalObject

    def initialize *params
      super &params
      @statuses = {}
    end

    def statuses
      @statuses
    end

    def status status_type
      @statuses['status_type']
    end

    ## without the last param, will add on a status, marking as multiple simultaneous statuses
    def add_temporal_status(name, time_point, status, replaces=nil)

    end

  end

  #write specs for this
  class TimeSpanRelation


    # for RrelativeTimeSpan objects a,b:

    #  a is before b (gap between)
    #  a is after b  (gap between)

    # a starting as b ending (before and touching))
    # a ending as b starting (after and touching)

    #  a starting with but ending before b
    #  a starting with but ending after b

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


end
