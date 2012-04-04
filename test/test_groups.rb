require 'helper'

class GroupsTest < Test::Unit::TestCase

  context "attributes" do

    setup do
     @c = GoToMeeting::API.new("12345")
    end

    should "generate valid get groups" do
      assert true
    end

  end
end
