class AddTitleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Title, :string
  end
end
