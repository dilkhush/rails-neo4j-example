class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :followed_id, uniqueness: { scope: :follower_id, message: 'Already following' }

  after_save :create_neo4j_relationship, on: :create

  def create_neo4j_relationship
    other_user = Neo4j::User.custom_find_or_create(follower_id)
    user = Neo4j::User.custom_find_or_create(followed_id)
    user.followings << other_user
  end
end