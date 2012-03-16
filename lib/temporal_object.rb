 require 'temporal_object/version'
 require 'time_span'


# @author Craig A. Cook
module TemporalObject

  # [Array]  of TimeSpan::TimeLine statuses for temporal attributes
  attr_accessor :temporal_statuses

  def initialize
    super
    @temporal_statuses = []         # Array of TimeSpan::TimeLine
  end

  #  add a timeline to the TemporalObject
  # @param [TimeSpan::TimeLine] timeline added to the object
  # @return [Array] adjusted list of timelines if no exception raised.
  def add_timeline(timeline)
    raise ArgumentError, "Can only add a TimeSpan::TimeLine to a TemporalObject's statuses" unless timeline.kind_of? TimeSpan::TimeLine
    @temporal_statuses << timeline
  end

  # remove all TimeLine s from the TemporalObject
  # @return [Array] the associated timelines
  def remove_timelines
    @temporal_statuses = []
  end

  # delete the cited   timeline
  # @param timeline [TimeSpan::TimeLine] timeline to delete
  # @raise ArgumentError if called with a non-TimeLine object
  # @return [TimeSpan::TimeLine, nil] TimeLIne deleted if successful or nil if not
  def remove_timeline(timeline)
    raise ArgumentError, "Can only remove a TimeLine with this call."  unless timeline.kind_of? TimeSpan::TimeLine
    @temporal_statuses.delete(timeline)
  end

end
