  require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

  describe "TemporalObject"  do

    let (:temporal_object) do
      TemporalObject::TemporalObject.new "Temporal Test Object"
    end

    let (:timeline) do
      TimeSpan::TimeLine.new "test timeline"
    end

    let (:timeline2) do
      TimeSpan::TimeLine.new "second test TimeLine"
    end


    context  "TemporalObject::TemporalObject" do

      context "#instance methods" do

        context "Initial state" do
          it "should have no timelines" do
            temporal_object.statuses.should be_empty
          end
        end

        context "TimeSpan::TimeLine manipulations" do

          before (:each) do
            temporal_object.add_timeline timeline
          end

          it "can add a TimeLine to the TemporalObject" do
            temporal_object.statuses.should_not be_empty, "TemporalObject::TimeLine not present."
          end

          it "can remove a given timeline from the temporal object" do
            temporal_object.add_timeline timeline2
            temporal_object.remove_timeline timeline
            temporal_object.statuses.should_not be_empty #, "TemporalObject::TimeLine does not have 1 status when it should."
          end

          it "can remove a given timeline from the temporal object" do
            temporal_object.remove_timeline timeline
            temporal_object.statuses.should be_empty #, "TemporalObject::TimeLine does not have 1 status when it should."
          end

          it "can remove all timelines from the TemporalObject" do
            temporal_object.remove_timelines
            temporal_object.statuses.should be_empty
          end

        end

      end

    end

  end
