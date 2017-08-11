class UsersController < ApplicationController

  def index
    flash[:message] ||= []

    @users = User.all
    render layout: "two_column"
  end

  def create
    flash[:message] = []
    user = User.create(user_params)      

    if  user.errors.full_messages != [] 
      flash[:message] = user.errors.full_messages
      return redirect_to '/users/index'
    
    else
      flash[:message] << "Successfully Created"
      return redirect_to '/users/index'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
