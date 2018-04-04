class Favorite < ApplicationRecord
	belongs_to :list, :class_name => "List"
    belongs_to :user, :class_name => "User"
end
