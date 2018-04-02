class List < ApplicationRecord
  	has_many :tasks, dependent: :destroy
  	belongs_to :user, :class_name => "User", :inverse_of => :lists
  	belongs_to :favorite_user, :class_name => "User", :inverse_of => :favorite_lists
end
