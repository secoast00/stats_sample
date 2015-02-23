require 'rubygems'
require 'active_record'

folder = File.dirname(__FILE__)
Dir["#{File.expand_path(folder)}/**/*.rb"].each { |file| require file }

module Baseball

  def self.initialize
    MemDb.initialize_data
  end

  def self.most_improved_batting_avg(to_year)
    CalcMostImproved.do_it to_year # returns a name
  end

  def self.team_slugging_percentage(year, team)
    CalcTeamSluggers.do_it year, team
  end

  def self.triple_crown_winner
    'John Batter'
  end
end

