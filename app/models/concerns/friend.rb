module Friend
  extend ActiveSupport::Concern
  included do
 	  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
    has_many :following_users, through: :relationships, source: :followed

    has_many :reverse_relationships, foreign_key: :followed_id, class_name:  'Relationship', dependent: :destroy
    has_many :my_followers, through: :reverse_relationships, source: :follower
  end

  def follow(user)
  	Relationship.create(followed_id: user.id, follower_id: id)
  end

  def unfollow(user)
  	Relationship.where(followed_id: user.id, follower_id: id).last.destroy
  end

  def neighborhood_friends
    Neo4j::User.where(my_id: self.id).last.friends_suggestion
  end
end