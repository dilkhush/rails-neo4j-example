class BookUser < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  after_create :create_neo4j_book_user

  def create_neo4j_book_user
    user = Neo4j::User.custom_find_or_create(user_id)
    book = Neo4j::Book.custom_find_or_create(book_id)
    user.fav_books << book
  end
end