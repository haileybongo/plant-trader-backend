class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    has_many :pictures

    validates :username, uniqueness: { case_sensitive: true }
    validates :username, presence: true
end
