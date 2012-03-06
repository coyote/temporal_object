 require 'temporal_object/version'
 require 'time_span'

# @author Craig A. Cook
module TemporalObject

  # @author Craig A. Cook
  class TemporalObject

    # [Array]  of TimeSpan::TimeLine statuses for temporal attributes
    attr_accessor :statuses
    # [String] object human readable identifier
    attr_accessor :name
    # [Object]  associated Ruby Object of any kind
    attr_accessor :reference_object   # arbitrary Ruby object associated.


    ## must be able to:
    #===============================
    #  -- add, remove a timeline
    #  -- erase all timelines, all statuses from a timeline
    #  -- remove all timelines

    # @param [String] nom is the TemporalObject's name
    # @param [Object] reference_obj is the object associated with this TemporalObject
    def initialize(nom="", reference_obj=Object.new)
      @statuses = []         # Array of TimeSpan::TimeLine
      @name     = ""
      @reference_object = reference_obj
    end

    #  add a timeline to the TemporalObject
    # @param [TimeSpan::TimeLine] timeline added to the object
    # @return [Array] adjusted list of timelines if no exception raised.
    def add_timeline(timeline)
      raise ArgumentError, "Can only add a TimeSpan::TimeLine to a TemporalObject's statuses" unless timeline.kind_of? TimeSpan::TimeLine
      @statuses << timeline
    end

    # remove all TimeLine s from the TemporalObject
    # @return [Array] the associated timelines
    def remove_timelines
      @statuses = []
    end

    # delete the cited   timeline
    # @param timeline [TimeSpan::TimeLine] timeline to delete
    # @raise ArgumentError if called with a non-TimeLine object
    # @return [TimeSpan::TimeLine, nil] TimeLIne deleted if successful or nil if not
    def remove_timeline(timeline)
      raise ArgumentError, "Can only remove a TimeLine with this call."  unless timeline.kind_of? TimeSpan::TimeLine
      @statuses.delete(timeline)
    end

  end

end
