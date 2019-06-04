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
        raise 'Not valid age' unless valid_age?(age)
        raise 'Not valid phone' unless valid_phone?(phone)
    end    

    def valid_age?(age)
        age > MIN_AGE
    end

    def valid_phone?(phone)
        phone.chars.first == FIRST_PHONE_CHAR
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