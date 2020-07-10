class Team < ApplicationRecord
  has_many :home_team_id, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :away_team_id, class_name: 'Game', foreign_key: 'away_team_id'

  def home_wins
    self.home_team_id.where(home_team_points: 3).count
  end

  def away_wins
    self.away_team_id.where(away_team_points: 3).count
  end

  def wins
    self.home_wins + self.away_wins
  end

  def home_draws
    self.home_team_id.where(home_team_points: 1).count
  end

  def away_draws
    self.away_team_id.where(away_team_points: 1).count
  end

  def draws
    self.home_draws + self.away_draws
  end

  def home_losses
    self.home_team_id.where(home_team_points: 0).count
  end

  def away_losses
    self.away_team_id.where(away_team_points: 0).count
  end

  def losses
    self.home_losses + self.away_losses
  end

  def home_matches_played
    self.home_wins + self.home_draws + self.home_losses
  end

  def away_matches_played
    self.away_wins + self.away_draws + self.away_losses
  end

  def matches_played
    self.home_matches_played + self.away_matches_played
  end

  def home_goals_for
    self.home_team_id.sum(:home_team_score)
  end

  def away_goals_for
    self.away_team_id.sum(:away_team_score)
  end

  def goals_for
    self.home_goals_for + self.away_goals_for
  end

  def home_goals_against
    self.home_team_id.sum(:away_team_score)
  end

  def away_goals_against
    self.away_team_id.sum(:home_team_score)
  end

  def goals_against
    self.home_goals_against + self.away_goals_against
  end

  def home_goal_differential
    self.home_goals_for - self.home_goals_against
  end

  def away_goal_differential
    self.away_goals_for - self.away_goals_against
  end

  def goal_differential
    self.goals_for - self.goals_against
  end

  def home_points
    self.home_team_id.sum(:home_team_points)
  end

  def away_points
    self.away_team_id.sum(:away_team_points)
  end

  def points
    self.home_points + self.away_points
  end

  def self.sorted_by_points
    Team.all.sort_by{ |t| [t.points, t.goal_differential, t.goals_for] }.reverse
  end

end
