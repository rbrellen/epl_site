class AddDateToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :date, :date
  end
end
