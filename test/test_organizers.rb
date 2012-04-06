require 'helper' 

class OrganizersTest < Test::Unit::TestCase

  context "attributes" do

    setup do
      @c = GoToMeeting::API.new("12345")
    end
    
    teardown do
      FakeWeb.clean_registry
    end
    

    should "generate valid create organizer" do
      assert true
    end
    
    should "generate valid update organizer" do
      assert true
    end
    
    should "generate valid delete organizer" do
      assert true
    end
    
    should "generate valid delete organizer by email" do
      assert true
    end
    
    should "generate valid get organizer" do
      assert true
    end
    
    should "generate valid get organizer by email" do
      assert true
    end
    
    should "generate valid get organizer by group" do
      assert true
    end

  end
end

