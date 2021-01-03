class Picture < ApplicationRecord
    beongs_to :user
    has_many :likes
    has_mant :comments
end
