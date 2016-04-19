# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = %w(education science computer datastructure database movie hindi english location car laptop social mobile office home)
unless Tag.first
  hashs = tags.collect{ |tag| { name: tag } }
  Tag.create(hashs)
end
unless User.first
  hashes = 1000.times.collect do
    {
      name: Faker::Name.name,
      email: Faker::Internet.email
    }
  end
  User.create(hashes)
end
unless Book.first
  hashes = 1000.times.collect do
  	{
  	  title: Faker::Book.title,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price
    }
  end
  Book.create(hashes)
end
unless Relationship.first
  user = User.first
  User.last(50).each do |u|
    user.follow(u) if u != user
  end
  user.following_users.each do |user|
    50.times do
      u = User.where(id: rand(1000)).first
      user.follow(u) if u != user
    end
  end
end

unless BookUser.first
  user = User.first
  books = Book.all
  user.books = books.sample(20)
  user.following_users.each do |u|
    u.books = books.sample(20)
  end
end