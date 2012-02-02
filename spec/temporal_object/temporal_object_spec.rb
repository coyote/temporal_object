  require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

  #  custom matchers:  http://rubydoc.info/gems/rspec-expectations/2.1.0/RSpec/Matchers
  #    or  http://railscasts.com/episodes/157-rspec-matchers-macros?view=asciicast

  describe "TemporalObject"  do

    describe "Temporal Object" do


      let (:temporal_object) do
        TemporalObject::TemporalObject.new
      end

      let (:first_time) do
        TimeSpan::RelativeTime.parse("Jan 1, 2010")
      end

      let (:second_time) do
        first_time + 1000
      end


      context "#instance methods" do

        context "category does not exist" do

          it "creates a new entry for the data" do
            ## put block around making assert that the tag now exists
            lambda {
              temporal_object.add_unitary_temporal_status("schooling", first_time, "entered" )
            }.should change {temporal_object.status('schooling')}

          end

        end
        
        context "simple actions" do
          it "removes a status from a temporal attribute" do
            temporal_object.add_temporal_status("membership", first_time, "enrolled")
            lambda {
              temporal_object.remove_temporal_status("membership", first_time )
            }.should change {temporal_object.status('membership')}
            
          end
        end

        ## without a 4th param, adds the status, with it,  replaces that status
        context "when there can be many statuses of a given type"
          it "inserts a temporal status at a given position" do
            temporal_object.add_temporal_status("membership", first_time, "enrolled")
            temporal_object.add_temporal_status("membership", second_time, "graduated")

            temporal_object.temporal_status("membership").count.should be_greater_than(1)
          end
        end

        context "when there can be only one like a given status" do

        end



          
          
      end

    end

  end