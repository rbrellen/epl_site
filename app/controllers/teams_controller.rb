class TeamsController < ApplicationController
  before_action :check_admin, only: [:edit, :create, :delete, :update, :new]

  def index
    @teams = Team.sorted_by_points
  end

  def show
    @team = Team.find(params[:id])
    @teams = Team.all
    @games = Game.where(home_team_id: @team.id).or(Game.where(away_team_id: @team.id)).order("date")
  end

  def new
      @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
