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

unless Book.first
  hashes = 100.times.collect do
  	{
  	  title: Faker::Book.title,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price
    }
  end
  Book.create(hashes)
end