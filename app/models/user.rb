class User < ActiveRecord::Base
  include Friend

  has_many :book_users
  has_many :books, through: :book_users

  def suggested_books
    Neo4j::User.where(user_id: id).last.books_suggestion.map(&:book_id)
  end
end