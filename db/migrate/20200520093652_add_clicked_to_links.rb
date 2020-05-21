class AddClickedToLinks < ActiveRecord::Migration[6.0]
  def up
    add_column :links, :count, :integer, null:false, default:0
  end

  def down
    remove_column :links, :count
  end
end
