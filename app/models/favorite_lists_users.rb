class FavoriteListsUsers < ApplicationRecord
  	belongs_to :favorite_list, :class_name => "User"
    belongs_to :favorite_user, :class_name => "List"
end
