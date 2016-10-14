class AddCasExtraAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_type, :string
    add_column :users, :user_privilegies, :text
  end
end
