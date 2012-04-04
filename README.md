#GoToMeeting

This is a project to build a Ruby wrapper for using Citrix's GoToMeeting REST API. 

##Requirements

You must have an active GoToMeeting account and a valid access token from the GoToMeeting OAuth flow. Please refer to the [authentication and authorization documentation](https://developer.citrixonline.com/page/authentication-and-authorization). 

##Install

It isn't an official repository yet so you can't do the normal gem install route.

	gem install go_to_meeting
	
For now you will need to install from source. 

	gem install go_to_meeting, :git => 'git://github.com/nathanwfish/GoToMeeting.git'

##Usage

Please refer to the [developer documentation](https://developer.citrixonline.com/api-overview/gotomeeting-rest-api) for a complete list of available methods. 

	@g2m = GoToMeeting::API.new(oauth_access_token) 
	@g2m.get_groups
	@g2m.get_meeting(meeting_id)

##Status

Tests are incomplete at this time. 