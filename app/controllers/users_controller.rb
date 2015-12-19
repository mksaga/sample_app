class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(params[:id])
    # if 'debugger' below is uncommented, rails server shows a console
    # that allows checking which user is displaying, their properties, etc.
    # debugger
  end
  
  def create
    # using "user_params" restricts what can be passed into signup form
    @user = User.new(user_params) 
    if @user.save 
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end
  
end
