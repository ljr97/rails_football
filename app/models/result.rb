class Result < ApplicationRecord
    validates :date, presence: true
    validates :home_team, presence: true,
                            length: { minimum: 5 }
    validates :away_team, presence: true
    validates :home_score, presence: true
    validates :away_score, presence: true
    validates :tournament, presence: true
    validates :city, presence: true
    validates :country, presence: true
    validates :neutral, presence: true

    def self.most_frequent_tournament
        find_by_sql(["SELECT tournament, count(*) as c FROM results GROUP BY tournament ORDER BY c DESC LIMIT 10 "])
    end

    def self.highest_scoring_teams
        find_by_sql(["SELECT away_team, count(*) as c FROM results GROUP BY away_team ORDER BY c DESC LIMIT 10"])
    end

    def self.highest_scoring_away_teams
        find_by_sql(["SELECT away_team, count(*) as c FROM results GROUP BY away_team ORDER BY c DESC LIMIT 10"])
    end

    def self.highest_scoring_home_teams
        find_by_sql(["SELECT home_team, count(*) as c FROM results GROUP BY home_team ORDER BY c DESC LIMIT 10"])
    end

end
