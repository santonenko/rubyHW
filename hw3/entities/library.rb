require 'yaml/store'

class Library
    attr_reader :authors, :books, :readers, :orders
    
    DEFAULT_TOP_VALUE = 3

    def initialize
        @authors = Array.new
        @books =   []   
        @readers = []
        @orders =  []
    end

    def to_s
        authorsJoin = authors.join("\n\t")
        booksJoin = books.join("\n\t")
        readersJoin = readers.join("\n\t")
        #ordersJoin = orders.sort_by{ |obj| obj.date }.join("\n\t")
        ordersJoin = orders.sort_by(&:date).join("\n\t")
        "Library{\n Authors:\n \t#{authorsJoin}" + 
        "\n Books:\n \t#{booksJoin}" +
        "\n Readers:\n \t#{readersJoin}" +
        "\n Orders:\n \t#{ordersJoin}" +
        "\n}"     
    end  

    def add(*entities)
        entities.flatten.each do |entity|
            case entity
            when Author then authors << entity unless authors.include?(entity)
            when Book then books << entity unless books.include?(entity)
            when Reader then readers << entity unless readers.include?(entity)
            when Order then orders << entity unless orders.include?(entity)
            else
                raise 'Type is not supported'
            end
        end
    end    
    
    def the_most_popular_book
        h = {}
        orders.each{|elem| h[elem.book]= h[elem.book] ? h[elem.book] + 1 : 1}
        value = h.max_by { |k, v| v }[0]
    end
    
    def top_popular_books(top = DEFAULT_TOP_VALUE)
        h = {}
        orders.each{|elem| h[elem.book]= h[elem.book] ? h[elem.book] + 1 : 1}
        value = h.max_by(top) { |k, v| v }.to_h.keys
    end

    def top_active_readers(top = DEFAULT_TOP_VALUE)
        h = {}
        orders.each{|elem| h[elem.reader]= h[elem.reader] ? h[elem.reader] + 1 : 1}
        value = h.max_by(top) { |k, v| v }.to_h.keys
        value.join("\n")
    end   

    def count_readers_who_took_top_popular(top = DEFAULT_TOP_VALUE)
        # Array of top popular books
        books = top_popular_books(top)
        # Hash [reader => books]
        h = {}
        orders.each{|elem|
            h[elem.reader.name] = Array.new unless h[elem.reader.name]
            h[elem.reader.name].push(elem.book) unless h[elem.reader.name].include?(elem.book) 
        }
        
        value = h.count{ |k, v| !(v & books).empty?}
    end    

    def to_h
       {
        :authors => authors,
        :books => books, 
        :readers => readers,
        :orders => orders
       }
    end

    # first way for serialization
    def save_first_way(filename)
        open(filename, 'w') {|f| YAML.dump(to_h, f)}
    end

    def load_first_way(filename)
        h = open(filename) {|f| YAML.load(f) }
        @authors = h[:authors]
        @books =   h[:books] 
        @readers = h[:readers]
        @orders =  h[:orders]
    end

    # second way for serialization
    def save_second_way(filename)
        store = YAML::Store.new(filename)
        store.transaction do
            store[:authors] = authors
            store[:books] = books
            store[:readers] = readers
            store[:orders] = orders
        end
    end

    def load_second_way(filename)
        store = YAML::Store.new(filename)
        store.transaction do
            @authors = store[:authors]
            @books = store[:books] 
            @readers = store[:readers]
            @orders = store[:orders]
        end
    end

end