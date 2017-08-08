class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    return render 'dojos/index.html.erb'
  end
end
