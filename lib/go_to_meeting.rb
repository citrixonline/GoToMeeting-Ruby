require "go_to_meeting/version"
require "go_to_meeting/attendees"
require "go_to_meeting/groups"
require "go_to_meeting/meetings"
require "go_to_meeting/organizers"
require "httparty"

module GoToMeeting
  class API
    
    include HTTParty
    format :json
    
    include GoToMeeting::Attendees
    include GoToMeeting::Groups
    include GoToMeeting::Meetings
    include GoToMeeting::Organizers
    
    def initialize(access_key = nil, extra_params = {})
      
      @access_key = access_key
      
      @default_options = {
        :base_uri => "https://api.citrixonline.com/G2M/rest/",
        :headers => {
          "Content-type" => "application/json",
          "Accept" => "application/json",
          "Authorization" => "OAuth oauth_token=#{@access_Key}" 
        }
      }
      
      default_options = @default_options.merge(extra_params).freeze
    end
  end
end