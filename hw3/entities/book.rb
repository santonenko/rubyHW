class Book
    attr_reader :title, :author, :description
    
    DEFAULT_DESCRIPTION = 'very interesting book'.freeze

    def initialize(title, author, description = DEFAULT_DESCRIPTION)
        @title = title
        @author = author    
        @description = description
    end

    def to_s
        "Book{#{author.name}. #{title}. #{description}}"     
    end  

    def ==(other)
        return unless self.class == other.class
        return self.title == other.title && 
               self.author == other.author
    end

end