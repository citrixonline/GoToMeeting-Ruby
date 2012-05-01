require "go_to_meeting/version"
require "go_to_meeting/attendees"
require "go_to_meeting/groups"
require "go_to_meeting/meetings"
require "go_to_meeting/organizers"
require "httparty"
require 'multi_json'

module GoToMeeting
  
  class Client
    
    include HTTParty
    format :json
    
    include GoToMeeting::Attendees
    include GoToMeeting::Groups
    include GoToMeeting::Meetings
    include GoToMeeting::Organizers
    
    attr_accessor :access_token
    
    def initialize(access_token = nil, extra_params = {})
      
      # the access token from oauth 
      @access_token = access_token
      
      @default_params = {
        :base_uri => "https://api.citrixonline.com/G2M/rest/",
        :headers => {
          "Content-type" => "application/json",
          "Accept" => "application/json",
          "Authorization" => "OAuth oauth_token=#{@access_token}" 
        }
      }
      
      @default_params = @default_params.merge(extra_params).freeze
      self.class.default_options = self.class.default_options.merge(@default_params).freeze
    end
    
  end
  
end