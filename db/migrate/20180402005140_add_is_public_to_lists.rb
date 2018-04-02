class AddIsPublicToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :isPublic, :boolean
  end
end
