module Neo4j
  class User
    include ::Neo4j::ActiveNode
    property :my_id, type: Integer

    has_many :in, :followings, type: :friends, model_class: "Neo4j::User"

    def friends_suggestion
    	followings.followings.to_a - followings.to_a
    end

    class << self
	    def custom_find_or_create(id)
	    	user = Neo4j::User.where(my_id: id).first
	    	return user if user
	    	Neo4j::User.create(my_id: id)
	    end
    end
  end
end