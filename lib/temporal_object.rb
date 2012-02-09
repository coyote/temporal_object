#require "temporal_object/version"
 require 'time_span'

module TemporalObject


  ## TimeLine holds the relationship between a TemporalObject and a TimeSpan::TimeLine.
  class TimeLine

    attr_accessor :timeline, :role_on_object

    def initialize(timeline, role)
      @timeline = timeline
      @role_on_object = role
    end

  end

  ## for checkov (coyote/tail) this object will be a primary edit object
  #     e.g., a scene, a character, a conflict

  class TemporalObject

    attr_accessor :timelines     # Array of TimeSpan::TimeLine

    def initialize
      @timelines = []         # Array of TemporalObject::TimeLine
    end

    def remove_all_timelines
      @timelines = []
    end

    ## wraps a TimeSpan::TimeLine object
    def add_timeline(timeline, role)
      tline = TemporalObject::TimeLine.new timeline, role
      add_object_timeline(tline)
    end

    ## passes in a TemporalObject::TimeLIne
    def add_temporal_object_timeline(timeline)
      @timelines << timeline
    end

    def find_timeline(timeline)
       @timelines.index(timeline)
    end

    def remove_timeline(timeline)
      @timelines.delete(timeline)
    end

    def find_timeline_by_name(name)
      @timelines.select{ |tl| tl.timeline.name == name }.first
    end

    def find_timeline_by_role(role)
       @timelines.select{ |tl| tl.role_on_object == role }.first
    end

  end



end
