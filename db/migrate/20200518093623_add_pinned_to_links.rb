class AddPinnedToLinks < ActiveRecord::Migration[6.0]
  def up
    add_column :links, :pinned, :boolean, null: false, default: false
  end

  def down
    remove_column :links, :pinned
  end
end
