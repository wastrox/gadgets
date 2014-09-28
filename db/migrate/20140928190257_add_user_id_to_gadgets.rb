class AddUserIdToGadgets < ActiveRecord::Migration
  def change
    add_column :gadgets, :user_id, :integer
    add_index :gadgets, :user_id
  end
end
