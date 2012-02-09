  require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

  #  custom matchers:  http://rubydoc.info/gems/rspec-expectations/2.1.0/RSpec/Matchers
  #    or  http://railscasts.com/episodes/157-rspec-matchers-macros?view=asciicast

  describe "TemporalObject"  do


    let (:temporal_object) do
      TemporalObject::TemporalObject.new
    end

    let (:timeline) do
      TimeSpan::TimeLine.new "test timeline"
    end

    let (:object_timeline) do
      TemporalObject::TimeLine.new timeline, "Hero's Actions'"
    end

    context "TemporalObject TimeLine" do

      it "creates a timeline" do
        object_timeline.timeline.should_not be_empty
      end

    end

    context  "TemporalObject  TemporalObject" do

      context "#instance methods" do

        context "Initial state" do
          it "should have no timelines" do
            temporal_object.timelines.should be_empty
          end
        end

        context "TimeSpan::TimeLine manipulations" do

          ## add_timeline will wrap a TimeSpan::TimeLine object in a TemporalObject::TimeLine
          before (:each) do
            temporal_object.add_timeline object_timeline, "test temporal_object's' timeline"
          end

          it "can add a TimeLine to the TemporalObject" do
            temporal_object.timelines.should_not be_empty, "TemporalObject::TimeLine not present."
          end

          it "can remove a given timeline from the temporal object" do
            temporal_object.remove_timeline object_timeline
            temporal_object.timelines.should be_empty, "TemporalObject::TimeLine remaining when it should not."
          end

          it "can find a timeline given the attaching TemporalObjects's name for it" do
            timeline = temporal_object.find_timeline_by_temporal_object_role   "test temporal_object's' timeline"
            timeline.should_not be_nil, "Could not find timeline based on attaching object's name for it."
          end

          it "can find a timeline based on the timeline's name" do
            timeline = temporal_object.find_timeline_by_timelines_name "test timeline"
            timeline.should_not be_nil, "Could not find timeline based on timeline name."
          end

          it "can remove all timelines from the TemporalObject" do
            temporal_object.add_timeline TimsSpan::TimeLine.new "second timeline"
            temporal_object.remove_all_timelines
            temporal_object.timelines.should be_empty
          end

        end

      end

    end

  end