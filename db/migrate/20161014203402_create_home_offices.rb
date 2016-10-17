class CreateHomeOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :home_offices do |t|
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
