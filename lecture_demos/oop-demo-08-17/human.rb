class Human
    attr_accessor :first_name
    attr_accessor :last_name

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
    end

    def display
        "#{@first_name} #{@last_name}"
    end

    private
        def breath
            p "Inhale and Exhale"
            return self
        end

        def eat
            p "Nom nom nom nom"
            self
        end

end
