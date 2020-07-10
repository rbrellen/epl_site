class AddColumnsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :home_team_points, :integer
    add_column :games, :away_team_points, :integer
  end
end
