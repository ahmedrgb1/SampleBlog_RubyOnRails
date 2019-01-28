class PagesController < ApplicationController

	def about
		#send dynamic value from the controller to the view 
		@title = 'About Us';
		@content = 'This is the about page';
	end
end
