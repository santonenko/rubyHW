require_relative 'Book'
require_relative 'Author'
require_relative 'Reader'
require_relative 'Order'
require_relative 'Library'

# Authors' instances
puts "================="
puts "demo for author creating"
puts "========"
begin  
    author1 = Author.new("J.Rolling", 1965, 'tratata1')
    author2 = Author.new("A.Puskin", 1799, 'tratata2')
    author3 = Author.new("fail", 2019, 'tratata3')
    #author2 = Author.new("no", 2018, 'tratata')
rescue StandardError => e
    puts e.message  
end      

puts author1
puts author3 unless author3 == nil

# Book's instance
puts "================="
puts "demo for book creating"
puts "========"
book1 = Book.new('Harry Potter', author1)
book2 = Book.new('Evgenyi Onegin', author2)
puts book1
puts "book1 == book2? " + (book1 == book2).to_s

# Reader's instance
puts "================="
puts "demo for reader creating"
puts "========"
reader1 = Reader.new('Petrov', 20, 'Geroev, 3', '+38063222', 'my@comp.ua')
reader2 = Reader.new('Petrov2', 20, 'Geroev, 3', '+38063333', 'my@comp.ua')
puts reader1
puts "reader1 == reader2? " + (reader1 == reader2).to_s

# Order's instance
puts "================="
puts "demo for order creating"
puts "========"
order1 = Order.new(Time.new(2019, 5, 31), reader1, book1)
order2 = Order.new(Time.new(2019, 5, 31), reader2, book2)
puts order1
puts "order1 == order2? " + (order1 == order2).to_s

# Library's instance
puts "================="
puts "demo for library creating"
puts "========"
library = Library.new
#
authors = Array.new
authors.push(author1)
authors.push(author2)
authors.push(author1) # duplicate author
authors.push(Author.new("M.Lermontov", 1814, 'tratata3'))
authors.push(Author.new("A.Chehov", 1860, 'tratata3'))
library.pushAuthor(author1, author2, author1)
library.pushAuthors(authors)

#Rolling: 'Harry Potter'
#Puskin: 'Evgenyi Onegin', 'Dubrovskyi', 'Vystrel'
#Lermontov: 'Parus', 'Mtsyri', 'Borodino'
#Chehov: 'Dyadya Vanya', 'Khameleon', 'Kashtanka', 'Malchiki', 'Student'

#
books = Array.new
books.push(book1)
books.push(book2)
books.push(Book.new('Dubrovskyi', author2))
books.push(Book.new('Vystrel', author2))
books.push(Book.new('Parus', authors[3]))
books.push(Book.new('Mtsyri', authors[3]))
books.push(Book.new('Borodino', authors[3]))
books.push(Book.new('Dyadya Vanya', authors[4]))
books.push(Book.new('Khameleon', authors[4]))
books.push(Book.new('Kashtanka', authors[4]))
books.push(Book.new('Malchiki', authors[4]))
books.push(Book.new('Student', authors[4]))
library.pushBooks(books) # 12 books 
#
readers = Array.new
readers.push(reader1)
readers.push(reader2)
readers.push(Reader.new('Ivanov', 30, 'Mironova, 2', '+380334677', 'my3@comp.ua'))
readers.push(Reader.new('Sidorov', 40, 'K.Marksa, 25', '+38012345', 'my4@comp.ua'))
readers.push(Reader.new('Egorov', 25, 'Mironova, 20', '+38078990', 'my5@comp.ua'))
readers.push(Reader.new('Egorov2', 26, 'Mironova, 26', '+3808989', 'my6@comp.ua'))
readers.push(Reader.new('Egorov3', 28, 'Mironova, 28', '+38078990', 'my7@comp.ua'))
readers.push(reader1) 
library.pushReaders(readers) # 7 readers
#
orders = Array.new
orders.push(order1)
orders.push(order2)

orders.push(Order.new(Time.new(2019, 5, 20), readers[0], books[0]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[0], books[1]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[0], books[2]))
orders.push(Order.new(Time.new(2019, 5, 31), readers[0], books[0]))

orders.push(Order.new(Time.new(2019, 5, 10), readers[1], books[0]))
orders.push(Order.new(Time.new(2019, 5, 20), readers[1], books[2]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[1], books[3]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[1], books[4]))

orders.push(Order.new(Time.new(2019, 5, 10), readers[2], books[0]))
orders.push(Order.new(Time.new(2019, 5, 20), readers[2], books[3]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[2], books[4]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[2], books[5]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[2], books[6]))

orders.push(Order.new(Time.new(2019, 5, 10), readers[3], books[0]))
orders.push(Order.new(Time.new(2019, 5, 20), readers[3], books[6]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[3], books[7]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[3], books[8]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[3], books[9]))

orders.push(Order.new(Time.new(2019, 5, 10), readers[4], books[0]))
orders.push(Order.new(Time.new(2019, 5, 20), readers[4], books[1]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[4], books[7]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[4], books[8]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[4], books[9]))

orders.push(Order.new(Time.new(2019, 5, 10), readers[5], books[0]))
orders.push(Order.new(Time.new(2019, 5, 20), readers[5], books[1]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[5], books[7]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[5], books[9]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[5], books[10]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[5], books[11]))
orders.push(Order.new(Time.new(2019, 5, 31), readers[5], books[9]))
orders.push(Order.new(Time.new(2019, 5, 31), readers[5], books[0]))
orders.push(Order.new(Time.new(2019, 5, 31), readers[5], books[1]))

orders.push(Order.new(Time.new(2019, 5, 30), readers[6], books[10]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[6], books[11]))
orders.push(Order.new(Time.new(2019, 5, 30), readers[6], books[3]))

library.pushOrders(orders)

puts library

puts "================="
puts "demo for library tasks"
puts "========"
puts "The most popular book: " + library.theMostPopularBook.to_s
puts "The top " + 3.to_s + " active reader: \n" + library.topActiveReader(3).to_s
puts "Count readers who took top " + 3.to_s + " of the most popular books: " + 
     library.countReadersWhoTookTopPopular(3).to_s

puts "================="
puts "demo for library store/load"
puts "========"
library.save1('store1.yml')     

library2 = Library.new
authors = Array.new
authors.push(author1)
authors.push(author2)
library2.pushAuthors(authors)
#
books = Array.new
books.push(book1)
books.push(book2)
library2.pushBooks(books)
#
readers = Array.new
readers.push(reader1)
readers.push(reader2)
readers.push(Reader.new('Ivanov', 30, 'Mironova, 2', '+380334677', 'my3@comp.ua'))
library2.pushReaders(readers)
#
orders = Array.new
orders.push(order1)
orders.push(order2)
library2.pushOrders(orders)
puts "=======library2========="
puts library2

library2.save2('store2.yml')     
library.load2('store2.yml')

puts "=======library after load from library2========="
puts library
puts "=======library after restore ========="
library.load1('store1.yml')
puts library