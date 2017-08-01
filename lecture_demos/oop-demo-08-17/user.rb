require_relative "human"

class User < Human # classes should always be PascalCase
    attr_accessor :email

    def initialize(first_name, last_name, email)
        super(first_name, last_name)
        @email = email
    end

    def explicitly_breath
        self.breath
    end

    def implicitly_breath
        breath
    end

    def display
        "#{super} #{@email}"
    end
end

#instantiate the user class
# variable is a name (user, willywonka) that refers to a location in memory where a value is stored.
human = Human.new('Mr.', 'Wiggles')

user = User.new('Matt', 'Tucker', 'mtucker@codingdojo.com')
# p user.first_name 
# p user.display
user.implicitly_breath






