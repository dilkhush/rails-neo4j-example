module Neo4j
  class User
    include ::Neo4j::ActiveNode
    property :user_id, type: Integer

    has_many :in, :followings, type: :friends, model_class: "Neo4j::User"
    has_many :in, :fav_books, type: :fav_books, model_class: "Neo4j::Book"

    def friends_suggestion
    	followings.followings.to_a - followings.to_a
    end

    class << self
	    def custom_find_or_create(id)
	    	user = Neo4j::User.where(user_id: id).first
	    	return user if user
	    	Neo4j::User.create(user_id: id)
	    end
    end
  end
end