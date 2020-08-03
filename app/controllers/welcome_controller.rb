class WelcomeController < ApplicationController
  def index
    @data = Result.most_frequent_tournament
    @home_goals = Result.highest_scoring_home_teams
    @away_goals = Result.highest_scoring_away_teams

  end
end
