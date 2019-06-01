class Reader
    attr_reader :name, :age, :address, :phone, :email
    
    def initialize(name, age, address, phone, email)
        unless validAge?(age) 
            raise "Not valid age"
        end    
        unless validPhone?(phone)
            raise "Not valid phone"
        end    
        @name = name
        @age = age
        @address = address   
        @phone = phone
        @email = email
    end

    def validAge?(age)
        return true if (age > 18)
        false
    end

    def validPhone?(phone)
        return true if (phone[0,1] == '+')
        false
    end

    def to_s
       "Reader{#{name}, #{age}, #{address}; #{phone}; #{email}}"     
    end    

    def ==(other)
        return false unless self.class == other.class
        return self.name == other.name && 
               self.age == other.age &&
               self.address == other.address &&
               self.phone == other.phone &&
               self.email == other.email
    end

end