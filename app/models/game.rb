class Game < ApplicationRecord
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :away_team, :class_name => 'Team'

  before_save :calculate_home_team_points
  before_save :calculate_away_team_points

  def teams
   Team.find(self.home_team_id, self.away_team_id)
  end

  def calculate_home_team_points
    if self.home_team_score.nil?
      points = nil
    elsif self.home_team_score > self.away_team_score
      points = 3
    elsif self.home_team_score < self.away_team_score
      points = 0
    elsif self.home_team_score == self.away_team_score
      points = 1
    else
      points = 999
    end
    self.home_team_points = points
  end

  def calculate_away_team_points
    if self.away_team_score.nil?
      points = nil
    elsif self.away_team_score > self.home_team_score
      points = 3
    elsif self.away_team_score < self.home_team_score
      points = 0
    elsif self.away_team_score == self.home_team_score
      points = 1
    else
      points = 999
    end
    self.away_team_points = points
  end

end
