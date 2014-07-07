class UsersMedicationController < ApplicationController 
	#before_action :set_user_med, only: [:mymed, :add_to_my_med, :remove_my_med]
	def mymed
	@u=User.find(session[:user_id]).user_medications
	
	end

	def add_to_my_med
		@user= User.find(session[:user_id])
		@user.user_medications.create(:dosage=>params[:dosage],:drug_id=>params[:drug_id])
		redirect_to users_medication_mymed_path
	end

	def remove_my_med
		@u=UserMedication.find(params[:user_medication])
		@u.destroy
		redirect_to users_medication_mymed_path
	end

end
