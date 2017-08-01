require_relative "mammal"

class Human < Mammal
    def explicitly_speak
        self.speak
    end

    def implicitly_speak
        speak
    end

    def explicitly_cry
        self.cry
    end

    def implicitly_cry
        cry
    end
end

mammal = Mammal.new
person = Human.new

# <--- PUBLIC --->
# p "mammal.who_am_i"
# p "-> #{mammal.who_am_i}"

# p "mammal.breath"
# p "-> #{mammal.breath}"

# p "person.who_am_i"
# p "-> #{person.who_am_i}"

# p "person.breath"
# p "-> #{person.breath}"

# <--- PROTECTED --->
# # mammal.speak
# p "mammal.calling_speak"
# p "-> #{mammal.calling_speak}"

# # person.speak
# p "person.explicitly_speak"
# p "-> #{person.explicitly_speak}"

# p "person.implicitly_speak"
# p "-> #{person.implicitly_speak}"

# <--- PRIVATE -->
# # mammal.cry
# p "mammal.calling_cry"
# p "-> #{mammal.calling_cry}"

# # person.cry
# # p "person.explicitly_cry"
# # p "-> #{person.explicitly_cry}"

# p "person.implicitly_cry"
# p "-> #{person.implicitly_cry}"