class User < ActiveRecord::Base
  include Friend

  has_many :book_users
  has_many :books, through: :book_users
end