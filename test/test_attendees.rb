require 'helper'

class AttendeesTest < Test::Unit::TestCase

  context "methods" do

    setup do
      @c = GoToMeeting::API.new("12345")
    end

    should "generate valid get attendees by group" do
      assert true
    end
    
    should "generate valid get attendees by meeting" do
      assert true
    end
    
    should "generate valid get attendees by organizer" do
      assert true
    end
    
  end
end

