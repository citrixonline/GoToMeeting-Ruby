module GoToMeeting
  module Meetings
    
    def create_meeting(params)
      @r = self.class.post("meetings", :body => params.to_json, :format => "HTML") 
    end
    
    def update_meeting(meeting_key, params)
      self.class.put("meetings/#{meeting_key}", :body => params.to_json)
    end
    
    def delete_meeting(meeting_key)
      self.class.delete("meetings/#{meeting_key}")
    end
    
    def get_meetings(query)
      self.class.get("meetings", :query => query)
    end
    
    def get_meetings_by_group(group_key)
      self.class.get("groups/#{group_key}/meetings")
    end
    
    def get_meetings_by_organizer(organizer_key)
      self.class.get("organizers/#{organizer_key}/meetings")
    end
    
  end
end