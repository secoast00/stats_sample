module Baseball
  class CalcTeamSluggers
    def self.do_it(year=2009, team='WAS')

      team = BattingData
      .where(year: year,).where(team_id: team)

      sluggers = team.to_a.each_with_object({}) { |b, h|
        h[b.player_code] = (b.at_bats == 0) ? 0.0 :
            (b.hits - (b.doubles + b.triples + b.home_runs) +
                (2 * b.doubles) + (3 * b.triples) + (4 * b.home_runs) /
                b.at_bats.to_f)
      }
      sluggers
    end
  end
end
