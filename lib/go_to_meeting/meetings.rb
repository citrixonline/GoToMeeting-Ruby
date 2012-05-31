module GoToMeeting
  module Meetings
    
    def get_meeting(meeting_key)
      self.class.get("meetings/#{meeting_key}")
    end
    
    def create_meeting(params)
      self.class.post("meetings", :body => params.to_json, :format => "HTML") 
    end
    
    def update_meeting(meeting_key, params)
      self.class.put("meetings/#{meeting_key}", :body => params.to_json)
    end
    
    def delete_meeting(meeting_key)
      self.class.delete("meetings/#{meeting_key}")
    end
    
    # expects a few items
    # scheduled = true or history = true
    # startDate and endDate in iso8601 format, use Time.now.utc.iso8601 or something similarin rails
    # @meetings = @client.get_meetings({"history" => "true", "endDate" => (Time.now - 15).utc.iso8601, "startDate" => (Time.now - (60 * 60 * 24 * 90)).utc.iso8601 })
    
    def get_meetings(query)
      self.class.get("meetings", :query => query)
    end
    
    def get_meetings_by_group(group_key, query)
      self.class.get("groups/#{group_key}/meetings", :query => query)
    end
    
    def get_meetings_by_organizer(organizer_key, query)
      self.class.get("organizers/#{organizer_key}/meetings", :query => query)
    end
    
  end
end