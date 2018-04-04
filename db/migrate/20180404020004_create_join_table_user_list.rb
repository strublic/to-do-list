class CreateJoinTableUserList < ActiveRecord::Migration[5.1]
  def change
    create_join_table :favorite_users, :favorite_lists do |t|
      # t.index [:favorite_user_id, :favorite_list_id]
      # t.index [:favorite_list_id, :favorite_user_id]
    end
  end
end
