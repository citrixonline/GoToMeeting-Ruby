module GoToMeeting
  
	module Organizers
	
		def create_organizer(params)
      self.class.post("organizers", :body => params).parsed_response
		end
	
		def update_organizer(organizer_key, params)
      self.class.put("organizers/#{organizer_key}", :body => params).parsed_response
		end
	
		def delete_organizer(organizer_key)
      self.class.delete("organizers/#{organizer_key}").parsed_response
		end
	
		def delete_organizer_by_email(organizer_email)
      self.class.delete("organizers", :query => {:email => organizer_email}).parsed_response
		end
	
		def get_organizer(organizer_key)
      self.class.get("organizers/#{organizer_key}").parsed_response
		end
	
		def get_organizer_by_email(organizer_email)
      self.class.get("organizers", :query => {:email => organizer_email}).parsed_response
		end
	
		def get_organizers_by_group(group_key)
      self.class.get("groups/#{group_key}/organizers").parsed_response
		end
	
	end
end