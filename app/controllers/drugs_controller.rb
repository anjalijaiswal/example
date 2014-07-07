class DrugsController < ApplicationController
	#before_action :set_user_drug, only: [:index]
	def index
		@drugs = Drug.all
	end
		
end
