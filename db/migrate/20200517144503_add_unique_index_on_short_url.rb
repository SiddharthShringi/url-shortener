class AddUniqueIndexOnShortUrl < ActiveRecord::Migration[6.0]
  def change
    change_column :links, :short_url, :string, null: false
    add_index :links, :short_url, unique: true
  end
end
