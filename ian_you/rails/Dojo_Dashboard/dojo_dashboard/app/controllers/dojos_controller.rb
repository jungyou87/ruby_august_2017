class DojosController < ApplicationController
  def index
    flash[:success] ||= []
    @dojos = Dojo.all
    return render 'dojos/index.html.erb'
  end

  def new
    flash[:message] ||= []
    return render 'dojos/new.html.erb'
  end

  def create
    @dojo = Dojo.create(dojo_params)
    
    if  @dojo.errors.full_messages != [] 
      flash[:message] = @dojo.errors.full_messages
      return redirect_to '/dojos/new'
    
    else
      flash[:success] ="Successfully created" 
      return redirect_to '/dojos'
    end
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
