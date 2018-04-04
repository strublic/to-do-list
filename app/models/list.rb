class List < ApplicationRecord
  	has_many :tasks, dependent: :destroy
  	has_many :favorites, dependent: :destroy
  	belongs_to :author, :class_name => "User", :foreign_key => 'user_id'
  	# has_many :favorites, :class_name => "Favorite",:foreign_key => 'favorite_id'
end
