class UsersController < ApplicationController

	def index
		# @users = User.all
		@users = User.where(is_active: true)
	end

  # Set
	def new
	@user = User.new
	end

	# Spike
	def create
	user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
	if user.save
	  session[:user_id] = user.id.to_s
	  redirect_to new_decision_path(current_user)
	else
	  root_path
	end
	end

	def show
	end

	def edit
	end

	def update
	@user = User.find(params[:id])
	  if current_user.id != @user
	    if current_user 
	      redirect_to new_decision_path(current_user)
	    else 
	      redirect_to new_session_path #send them to login page/ make user login in
	    end
	  elsif @user.update_attributes(params.require(:user).permit(:name, :email, :is_active))
	    redirect_to users_path
	  else
	    render 'edit'
	  end
	end

	def destroy
	@user = User.find(params[:id])
	@user.is_active = false 
	@user.save
	# Exactly the same idea as this little number:
	#    User.find_by(id: params[:id])
	  redirect_to users_path
	end

	def reactivate
	@user = User.find(params[:id])
	end

end
