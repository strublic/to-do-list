class RemoveStatusFromLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :status, :integer
  end
end
