module GoToMeeting
  module Attendees
    
    def get_attendees_by_group(group_key, query)
      self.class.get("/groups/#{group_key}/attendees", :query => query)
    end
    
    def get_attendees_by_meeting(meeting_key, query)
      self.class.get("/meetings/#{meeting_key}/attendees", :query => query)
    end
    
    def get_attendees_by_organizer(organizer_key, query)
      self.class.get("/organizers/#{organizer_key}/attendees", :query => query)
    end
    
  end
end
