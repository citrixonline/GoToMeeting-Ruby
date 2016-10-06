module GoToMeeting
	module Groups
		
		def get_groups
      self.class.get("/groups")
		end
		
	end
end
