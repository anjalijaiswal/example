class UsersController < ApplicationController
	#skip_before_filter :authorize, :only => [:login, :create]
	def login
		if @user=User.find_by_email_and_password(params[:email],params[:password])
			session[:user_id]=@user.id
			redirect_to @user
		else
			puts "Check your details again!"
			redirect_to users_path
		end
	end

	def new
		@user= User.new
	end

	 def create
   # Not the final implementation!
		@user = User.new(name:params[:name], address:params[:address], age:params[:age], email:params[:email], phone:params[:phone], password:params[:password])
        @user.save
       respond_to do |format|
	        if @user.save
	         
	         	 format.html { redirect_to users_url }
		         format.xml { render :xml => @user,:status => :created, :location => @user }
		         format.html { redirect_to @user, notice: 'User was successfully created.' }
		         format.json { render action: 'show', status: :created, location: @user }
	      	else
	            format.html { render action: 'new' }
	        	format.json { render json: @user.errors, status: :unprocessable_entity }
	      	end
    	end
    end

  	def show
  		@current_user = User.find(session[:user_id])
  	end

  	def logout
  		session[:user_id]=nil
  		redirect_to users_path
  	end

	private	
			def set_user
				#@user= User.find(params[:id])
			end

			def user_params
				#params.require(:user).permit(:name, :address, :password, :email, :phone, :age, :type)
			end
end
