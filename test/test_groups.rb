require 'helper'

class GroupsTest < Test::Unit::TestCase

  context "attributes" do

    setup do
     @c = GoToMeeting::Client.new("12345")
    end
    
    teardown do
      FakeWeb.clean_registry
    end
    

    should "generate valid get groups" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/groups", :body => '[{"groupkey":12345},{"groupkey": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_groups
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["groupkey"]
      # FakeWeb.last_request
    end

  end
end
