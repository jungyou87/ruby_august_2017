class TimesController < ApplicationController
    def main
        @time = Time.now.in_time_zone

        

        return render 'times/display.html.erb'
    end
end
