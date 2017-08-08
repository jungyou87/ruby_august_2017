class RpgController < ApplicationController

    def index
        # session.clear
        session[:gold] ||= 0
        session[:log] ||= []
        @gold = session[:gold]
        @logs = session[:log]
        return render 'rpg/index.html.erb'
    end

    def farm
        @farm = Random.new
        @earned_gold = @farm.rand(10..20)
        # p @earned_gold
        @logtime = Time.new.in_time_zone.to_formatted_s(:dojo_datetime)
        session[:gold] += @earned_gold
        session[:log].insert(0, { 
            :log => "Earned #{@earned_gold} golds from the farm! (#{@logtime})",
            :status => true }
        )

        return redirect_to ''
    end

    def cave
        @cave = Random.new
        @earned_gold = @cave.rand(5..10)
        # p @earned_gold
        @logtime = Time.new.in_time_zone.to_formatted_s(:dojo_datetime)
        session[:gold] += @earned_gold
        session[:log].insert(0, { 
            :log => "Earned #{@earned_gold} golds from the cave! (#{@logtime})",
            :status => true }
        )
        return redirect_to ''
    end

    def house
        @house = Random.new
        @earned_gold = @house.rand(2..5)
        # p @earned_gold
        @logtime = Time.new.in_time_zone.to_formatted_s(:dojo_datetime)
        session[:gold] += @earned_gold
        session[:log].insert(0, { 
            :log => "Earned #{@earned_gold} golds from the house! (#{@logtime})",
            :status => true }
        )
        return redirect_to ''
    end

    def casino
        @house = Random.new
        @earned_gold = @house.rand(-50..50)
        # p @earned_gold
        @logtime = Time.new.in_time_zone.to_formatted_s(:dojo_datetime)
        if @earned_gold >= 0
            session[:gold] += @earned_gold
            session[:log].insert(0, { 
            :log => "Earned #{@earned_gold} golds from the casino! (#{@logtime})",
            :status => true }
        )
            return redirect_to ''

        elsif @earned_gold < 0
            session[:gold] += @earned_gold
            session[:log].insert(0, {
                :log => "Entered a casion and lost #{@earned_gold*-1} golds... Ouch. (#{@logtime})",
                :status => false }
            )
            return redirect_to ''
        end
    end

end
