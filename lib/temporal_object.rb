#require "temporal_object/version"
 require 'time_span'

module TemporalObject

  ## this will be an individual status attached to a TimeSpan::RelativeTime
  class TemporalStatus

    attr_accessor  :text, :subject, :see_also, :obj

    def initialize(objekt, description, subj, see_list=nil)
      obj      = objekt
      text     = description
      see      = subj                         # primary TemporalObject in question
      see_also = see_list                     # Array of TemporalObjects
    end

  end

  ## for checkov (coyote/tail) this object will be a primary edit object
  #     e.g., a scene, a character, a conflict

  class TemporalObject

    attr_accessor :statuses     # Array of TimeSpan::TimeLine

    ## must be able to:
    #===============================
    #  -- get, add, remove a timeline
    #  -- get, add, remove a status from a timeline
    #  -- erase all timelines, all statuses from a timeline
    #  -- remove all timelines
    #  -- get a list of related statuses from a status
    #  -- get a list of all related statuses for a timline
    #  -- get all related statuses

    def initialize
      @statuses = []         # Array of TimeSpan::TimeLine
    end

  end



end
