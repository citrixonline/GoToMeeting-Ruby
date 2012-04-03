module GoToMeeting
  module Meetings
    
    def create_meeting(params)
      self.class.post("meetings", :body => params).parsed_response
    end
    
    def update_meeting(meeting_key, params)
      self.class.put("meetings/#{meeting_key}", :body => params).parsed_response
    end
    
    def delete_meeting(meeting_key)
      self.class.delete("meetings/#{meeting_key}").parsed_response
    end
    
    def get_meetings(query)
      self.class.get("meetings", :query => query).parsed_response
    end
    
    def get_meetings_by_group(group_key)
      self.class.get("groups/#{group_key}/meetings").parsed_response
    end
    
    def get_meetings_by_organizer(organizer_key)
      self.class.get("organizers/#{organizer_key}/meetings").parsed_response
    end
    
  end
end