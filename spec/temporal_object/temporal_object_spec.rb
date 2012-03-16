  require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

  # functionality is defined as a mixin, not an Object, so
  #  here we create a mock class for testing the temporal_object mixin gem
  class TemporalObjectTester  < Object
    require 'temporal_object'
    include TemporalObject
  end

  describe "TemporalObject"  do

    let (:temporal_object) do
      TemporalObjectTester.new
    end

    let (:timeline) do
      TimeSpan::TimeLine.new "test timeline"
    end

    let (:timeline2) do
      TimeSpan::TimeLine.new "second test TimeLine"
    end

    context  "TemporalObject" do

      context "added #instance methods" do

        context "initial state" do

          it "should have no timelines" do
            temporal_object.temporal_statuses.should be_empty
          end

        end

        context "methods defined" do

          it "should respond_to? remove_timelines" do
            temporal_object.should respond_to :remove_timelines
          end

          it "should respond_to? add_timeline (some_timeline)" do
            temporal_object.should respond_to(:add_timeline)
          end

          it "should respond_to? remove_time"  do
            temporal_object.should respond_to(:remove_timeline)
          end

        end


        context "TimeSpan::TimeLine manipulations" do

          before (:each) do
            temporal_object.add_timeline timeline
          end

          it "can add a TimeLine to the TemporalObject" do
            temporal_object.temporal_statuses.should_not be_empty, "TemporalObject::TimeLine not present."
          end

          it "should not allow adding a non-timeline object to the temporal statuses" do
            lambda { temporal_object.add_timeline "foo"}.should raise_error ArgumentError
          end


          it "can remove a given timeline from the temporal object" do
            temporal_object.add_timeline timeline2
            temporal_object.remove_timeline timeline
            temporal_object.temporal_statuses.should_not be_empty #, "TemporalObject::TimeLine does not have 1 status when it should."
          end

          it "should not accept a non-timeline for removal from temporal statuses" do
            lambda { temporal_object.remove_timeline "foo" }.should raise_error, ArgumentError
          end

          it "can remove a given timeline from the temporal object" do
            temporal_object.remove_timeline timeline
            temporal_object.temporal_statuses.should be_empty #, "TemporalObject::TimeLine does not have 1 status when it should."
          end

          it "can remove all timelines from the TemporalObject" do
            temporal_object.remove_timelines
            temporal_object.temporal_statuses.should be_empty
          end

        end

      end

    end

  end
