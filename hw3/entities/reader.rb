class Reader
    attr_reader :name, :age, :address, :phone, :email
    
    FIRST_PHONE_CHAR = '+'.freeze
    MIN_AGE = 18

    def initialize(name, age, address, phone, email)
        validate(age, phone)
        @name = name
        @age = age
        @address = address   
        @phone = phone
        @email = email
    end

    def validate(age, phone)
        raise 'Not valid age' unless validAge?(age)
        raise 'Not valid phone' unless validPhone?(phone)
    end    

    def validAge?(age)
        return true if (age > MIN_AGE)
        false
    end

    def validPhone?(phone)
        return true if (phone.chars.first == FIRST_PHONE_CHAR)
        false
    end

    def to_s
       "Reader{#{name}, #{age}, #{address}; #{phone}; #{email}}"     
    end    

    def ==(other)
        return unless self.class == other.class
        return self.name == other.name && 
               self.age == other.age &&
               self.address == other.address &&
               self.phone == other.phone &&
               self.email == other.email
    end

end