require 'csv'


module Baseball
  class BattingData < ActiveRecord::Base
    # belongs_to :players

    def batting_average
      return 0.0 unless at_bats > 0
      hits.to_f / at_bats
    end

    def slugging_percentage
      return 0.0 unless at_bats > 0
      total_bases / at_bats.to_f
    end

    def singles
      hits - (doubles + triples + home_runs)
    end

    def total_bases
      self.singles
      +(2 * doubles) + (3 * triples) + (4 * home_runs)
    end
  end
end