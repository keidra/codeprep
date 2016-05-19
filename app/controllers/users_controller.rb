class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	# puts new_user_params[:email], new_user_params[:password], new_user_params[:name]
  	# User.create new_user_params[:email], new_user_params[:password], new_user_params[:name]
  	@user = User.create new_user_params

	  if @user.valid?
	    session[:user_id] = @user.id
	    flash[:success] = "User logged in!!"
	    redirect_to "/main"
	  else
	    flash[:danger] = "Credentials Invalid!!"
	    redirect_to signup_path
	  end
  end

  private

  def new_user_params
	  params.require(:user).permit(:email, :password, :name)
	end
end
