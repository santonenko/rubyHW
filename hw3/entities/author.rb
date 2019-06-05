class Author
    attr_reader :name, :biography, :year_of_birth
    
    DEFAULT_BIOGRAPHY = 'some biography'.freeze
    MIN_CHARS = 3
    MAX_CHARS = 15

    def initialize(name, year_of_birth, biography = DEFAULT_BIOGRAPHY)
        validate(name, year_of_birth)
        @name = name
        @year_of_birth = year_of_birth
        @biography = biography   
    end

    def validate(name, year_of_birth)
        raise 'Not valid name' unless valid_name?(name)
        raise 'Not valid year_of_birth' unless valid_year_of_birth?(year_of_birth)
    end    

    def valid_name?(name)
        (MIN_CHARS..MAX_CHARS).include?(name.length)
    end

    def valid_year_of_birth?(year_of_birth)
        year_of_birth < Time.now.year
    end

    def to_s
       "Author{#{name}, #{year_of_birth}, #{biography}}"     
    end   
    
    def ==(other)
        return unless self.class == other.class #if classes not equil return nil
        return self.name == other.name && 
               self.year_of_birth == other.year_of_birth
    end

end