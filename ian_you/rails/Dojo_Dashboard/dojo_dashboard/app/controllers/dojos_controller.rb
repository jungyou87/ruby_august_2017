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

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @students = Student.joins(:dojo).where("dojos.id = #{params[:dojo_id]}")
    return render 'dojos/dojo.html.erb'
  end

  def edit
    flash[:message] ||= []
    @dojo = Dojo.find(params[:dojo_id])
    return render 'dojos/edit.html.erb'
  end

  def update
    @id = params[:dojo_id]
    @dojo = Dojo.update(@id, dojo_params)

    if  @dojo.errors.full_messages != [] 
      flash[:message] = @dojo.errors.full_messages
      return redirect_to "/dojos/#{@id}/edit"
    
    else
      # flash[:success] ="Successfully created" 
      return redirect_to '/dojos'
    end

  end

  def destroy
    Dojo.find(params[:dojo_id]).destroy
    return redirect_to '/dojos'

  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
