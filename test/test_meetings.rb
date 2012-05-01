require 'helper'

class MeetingsTest < Test::Unit::TestCase

  context "attributes" do

    setup do
      @c = GoToMeeting::Client.new("12345")
    end
    
    teardown do
      FakeWeb.clean_registry
    end
    
    should "generate valid get meeting" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/meetings/54321", :body => '{"meetingid":"54321"}', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_meeting('54321')
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Hash)
      assert_equal('54321', @r.parsed_response["meetingid"]) 
    end

    should "generate valid create meetings" do
      FakeWeb.register_uri(:post, "https://api.citrixonline.com/G2M/rest/meetings", :body => "12345", :content_type => "application/json", :status => ["201", "Created"])
      @r = @c.create_meeting({"subject" => "this meeting"})
      assert FakeWeb.last_request.body.is_a?(String)
      assert_equal('{"subject":"this meeting"}', FakeWeb.last_request.body)
      assert_equal('12345', @r.parsed_response) 
    end
    
    should "generate valid update meetings" do
      FakeWeb.register_uri(:put, "https://api.citrixonline.com/G2M/rest/meetings/12345", :content_type => "application/json", :status => ["204", "No Content"])
      @r = @c.update_meeting("12345", {"subject" => "this meeting"})
      assert FakeWeb.last_request.body.is_a?(String)
      assert_equal('{"subject":"this meeting"}', FakeWeb.last_request.body)
      assert_equal("204", @r.response.code)
    end
    
    should "generate valid delete meeting" do
      FakeWeb.register_uri(:delete, "https://api.citrixonline.com/G2M/rest/meetings/12345", :content_type => "application/json", :status => ["204", "No Content"])
      @r = @c.delete_meeting("12345")
      assert_equal("204", @r.response.code)
    end
    
    should "generate valid get meetings" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/meetings?history=true&startDate=2011-11-15T09%3A00%3A00Z&endDate=2011-11-15T09%3A00%3A00Z", :body => '[{"meetingid":12345},{"meetingid": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_meetings({"history"=> "true", "startDate" => "2011-11-15T09:00:00Z", "endDate" => "2011-11-15T09:00:00Z"})
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["meetingid"]
    end
    
    should "generate valid get meetings by group" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/groups/12345/meetings", :body => '[{"meetingid":12345},{"meetingid": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_meetings_by_group("12345")
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["meetingid"]
    end
    
    should "generate valid get meetings by organizer" do
      FakeWeb.register_uri(:get, "https://api.citrixonline.com/G2M/rest/organizers/12345/meetings", :body => '[{"meetingid":12345},{"meetingid": 54321}]', :content_type => "application/json", :status => ["200", "OK"])
      @r = @c.get_meetings_by_organizer("12345")
      assert_not_nil @r
      assert @r.parsed_response.is_a?(Array)
      assert_not_nil @r.parsed_response.first["meetingid"]
    end
    
  end
end

