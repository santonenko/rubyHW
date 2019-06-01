class Author
    attr_reader :name, :biography, :yearOfBirth
    
    def initialize(name, yearOfBirth, biography='')
        unless validName?(name) 
            raise 'Not valid name'  
        end    
        unless validYearOfBirth?(yearOfBirth)
            raise "Not valid yearOfBirth"
        end    
        @name = name
        @yearOfBirth = yearOfBirth
        @biography = biography   
    end

    def validName?(name)
        return true if (name.length >= 3 && name.length <= 15)
        false
    end

    def validYearOfBirth?(yearOfBirth)
        return true if (yearOfBirth < Time.now.year)
        false
    end

    def to_s
       "Author{#{name}, #{yearOfBirth}, #{biography}}"     
    end   
    
    def ==(other)
        return false unless self.class == other.class
        return self.name == other.name && 
               self.yearOfBirth == other.yearOfBirth
    end

end