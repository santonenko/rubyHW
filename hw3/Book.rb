class Book
    attr_reader :title, :author, :description
    
    def initialize(title, author, description="very interesting book")
        @title = title
        @author = author    
        @description = description
    end

    def to_s
        "Book{#{author.name}. #{title}. #{description}}"     
    end  

    def ==(other)
        return false unless self.class == other.class
        return self.title == other.title && 
               self.author == other.author
    end

end