require 'yaml/store'

class Library
    attr_reader :authors, :books, :readers, :orders
    
    def initialize
        @authors = Array.new
        @books = Array.new   
        @readers = Array.new
        @orders = Array.new
    end

    def to_s
        authorsJoin = authors.join("\n\t")
        booksJoin = books.join("\n\t")
        readersJoin = readers.join("\n\t")
        ordersJoin = orders.sort_by{ |obj| obj.date }.join("\n\t")
        "Library{\n Authors:\n \t#{authorsJoin}" + 
        "\n Books:\n \t#{booksJoin}" +
        "\n Readers:\n \t#{readersJoin}" +
        "\n Orders:\n \t#{ordersJoin}" +
        "\n}"     
    end  

    def pushAuthor(*authorArr)
        authorArr.each{|elem| authors.push(elem) unless authors.include?(elem)}
    end   

    def pushAuthors(authorArr)
        authorArr.each{|elem| authors.push(elem) unless authors.include?(elem)}
    end  

    def pushBooks(bookArr)
        bookArr.each{|elem| books.push(elem) unless books.include?(elem)}
    end   

    def pushReader(*readerArr)
        readerArr.each{|elem| readers.push(elem) unless readers.include?(elem)}
    end   

    def pushReaders(readerArr)
        readerArr.each{|elem| readers.push(elem) unless readers.include?(elem)}
    end

    def pushOrder(*orderArr)
        orderArr.each{|elem| orders.push(elem) unless orders.include?(elem)}
    end   

    def pushOrders(orderArr)
        orderArr.each{|elem| orders.push(elem) unless orders.include?(elem)}
    end  

    def theMostPopularBook
        h = {}
        orders.each{|elem| h[elem.book]= h[elem.book] ? h[elem.book] + 1 : 1}
        value = h.max_by { |k, v| v }[0]
    end
    
    def topPopularBook(top = 3)
        h = {}
        orders.each{|elem| h[elem.book]= h[elem.book] ? h[elem.book] + 1 : 1}
        value = h.max_by(top) { |k, v| v }.to_h.keys
    end

    def topActiveReader(top = 3)
        h = {}
        orders.each{|elem| h[elem.reader]= h[elem.reader] ? h[elem.reader] + 1 : 1}
        value = h.max_by(top) { |k, v| v }.to_h.keys
        value.join("\n")
    end   

    def countReadersWhoTookTopPopular(top = 3)
        # Array of top popular books
        books = topPopularBook(top)
        # Hash [reader => books]
        h = {}
        orders.each{|elem|
            h[elem.reader.name] = Array.new unless h[elem.reader.name]
            h[elem.reader.name].push(elem.book) unless h[elem.reader.name].include?(elem.book) 
        }
        
        value = h.count{ |k, v| !(v & books).empty?}
    end    

    # first way for serialization
    def save1(filename)
        h = {"authors" => authors,
          "books" => books, 
          "readers" => readers,
          "orders" => orders
        }
        open(filename, 'w') {|f| YAML.dump(h, f)}
    end

    def load1(filename)
        h = open(filename) {|f| YAML.load(f) }
        @authors = h["authors"]
        @books = h["books"] 
        @readers = h["readers"]
        @orders = h["orders"]
    end

    # second way for serialization
    def save2(filename)
        store = YAML::Store.new(filename)
        store.transaction do
            store["authors"] = authors
            store["books"] = books
            store["readers"] = readers
            store["orders"] = orders
        end
    end

    def load2(filename)
        store = YAML::Store.new(filename)
        store.transaction do
            @authors = store["authors"]
            @books = store["books"] 
            @readers = store["readers"]
            @orders = store["orders"]
        end
    end

end