require 'helper'

class AttendeesTest < Test::Unit::TestCase

  context "methods" do

    setup do
      @c = GoToMeeting::Client.new("12345")
    end
    
    teardown do
      FakeWeb.clean_registry
    end

    should "generate valid get attendees by group" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/groups/12345/attendees", :body => '[{"meetingid":12345},{"meetingid": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_attendees_by_group("12345")
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["meetingid"]
    end
    
    should "generate valid get attendees by meeting" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/meetings/12345/attendees", :body => '[{"meetingid":12345},{"meetingid": 12345}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_attendees_by_meeting("12345")
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.first["meetingid"]
      # FakeWeb.last_request
    end
    
    should "generate valid get attendees by organizer" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/organizers/12345/attendees", :body => '[{"meetingid":12345},{"meetingid": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_attendees_by_organizer("12345")
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["meetingid"]
      # FakeWeb.last_request
    end
    
  end
end

