class Order
    attr_reader :date, :reader, :book
    
    def initialize(date, reader, book)
        @date = date
        @reader = reader    
        @book = book
    end

    def to_s
        fmtDate = date.strftime("%d.%m.%Y")
        "Order{#{fmtDate}: #{reader.name} took #{book.title}}"     
    end  

    def ==(other)
        return unless self.class == other.class
        return self.date == other.date && 
               self.reader == other.reader &&
               self.book == other.book
    end

end