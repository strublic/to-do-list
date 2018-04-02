class Task < ApplicationRecord
	belongs_to :list
	belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
end
