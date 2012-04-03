module GoToMeeting
	module Groups
		
		def get_groups
      self.class.get("groups").parsed_response
		end
		
	end
end