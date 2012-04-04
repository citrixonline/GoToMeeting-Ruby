require 'helper'

class MeetingsTest < Test::Unit::TestCase

  context "attributes" do

    setup do
      @c = GoToMeeting::API.new("12345")
    end

    should "generate valid create meetings" do
      assert true
    end
    
    should "generate valid update meetings" do
      assert true
    end
    
    should "generate valid delete meeting" do
      assert true
    end
    
    should "generate valid get meetings" do
      assert true
    end
    
    should "generate valid get meetings by group" do
      assert true
    end
    
    should "generate valid get meetings by organizer" do
      assert true
    end
    
  end
end

