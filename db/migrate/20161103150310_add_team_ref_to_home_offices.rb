class AddTeamRefToHomeOffices < ActiveRecord::Migration[5.0]
  def change
    add_reference :home_offices, :team, foreign_key: true
  end
end
