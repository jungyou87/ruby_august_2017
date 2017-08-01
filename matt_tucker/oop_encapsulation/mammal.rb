class Mammal
    def initialize
        return self
    end

    # Public breath
    def breath
        "Inhale and exhale"
    end

    # Public Eat
    def eat
        "Yum yum yum"
    end

    # Public self
    def who_am_i
        return self
    end

    # Public calling protected speak method
    def calling_speak
        speak
    end

    # Public calling private cry method
    def calling_cry
        cry
    end

    # Protected Methods
    protected
        def speak
            "I am a protected method"
        end

    # Private Methods
    private
        def cry
            "Sniff sniff..."
        end
end