module Neo4j
  class Book
    include ::Neo4j::ActiveNode
    property :book_id, type: Integer

    class << self
	    def custom_find_or_create(id)
	    	book = Neo4j::Book.where(book_id: id).first
	    	return book if book
	    	Neo4j::Book.create(book_id: id)
	    end
    end
  end
end