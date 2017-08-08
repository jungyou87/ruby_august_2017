class UsersController < ApplicationController
    def index
        session[:count] ||= 0
        session[:survey] = nil
        return render 'users/index.html.erb'
    end

    def submit
        session[:survey] = params[:survey]
        session[:count] += 1
        redirect_to '/result'
    end

    def show
        return redirect_to '/' unless session[:survey]
        @count= session[:count]
        @survey = session[:survey]

        flash[:notification] = "Thanks for submitting this form! You have submitted this for #{@count} times now"

        return render 'users/result.html.erb'
    end
end
