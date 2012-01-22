  require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

  describe "TemporalObject"  do

    context "RelativeTimeSpan" do

      before (:each) do
        @alpha = TemporalObject::RelativeTimeSpan.new
        @alpha.starting  = TemporalObject::RelativeTime.now - 1000
        @alpha.ending = TemporalObject::RelativeTime.now
      end

      context "instance methods" do

        context "comparators" do

          context "same ending time, alpha starts before beta" do

            before (:each) do
              @beta = TemporalObject::RelativeTimeSpan.new
              @beta.starting = @alpha.starting + 10
              @beta.ending = @alpha.ending
            end

            context "alpha should be" do


              it "starting before beta" do                #+1
                @alpha.should be_starting_before(@beta)
              end


              it "ending with beta" do           #+4
                @alpha.should be_ending_with(@beta)
              end

            end

            context "alpha should not be" do

              it "starting after beta" do
                @alpha.should_not be_starting_after(@beta)  #-2
              end

              it "starting with beta" do           #-3
                @alpha.should_not be_starting_with(@beta)
              end

              it "ending before beta" do      #-5
                @alpha.should_not be_ending_before(@beta)
              end

              it "ending after beta" do      #-6
                @alpha.should_not be_ending_after(@beta)
              end

              it "ending before beta is starting" do    #-7
                @alpha.should_not be_ending_before_other_starting(@beta)
              end

              it "ending as beta is starting" do          #-8
                @alpha.should_not be_ending_as_other_starting(@beta)
              end

              it "starting after beta ending" do          #-9
                @alpha.should_not be_starting_after_other_ending(@beta)
              end

              it "starting as beta is ending" do          #-10
                @alpha.should_not be_starting_as_other_ending(@beta)
              end

            end

          end

        end

      end

    end

  end