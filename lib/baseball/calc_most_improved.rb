module Baseball
  class CalcMostImproved
    def self.do_it(to_year)

      from_year_data, to_year_data = retrieve_data(to_year)

      ensure_common_players(from_year_data, to_year_data)

      to_avgs   = get_averages(to_year_data).sort_by { |a| a[0][0] }
      from_avgs = get_averages(from_year_data).sort_by { |a| a[0][0] }

      top = calc_improvements(from_avgs, to_avgs).max { |b| b[1] }

      top_name = Player.where(player_code: top[0])
      .pluck(:first_name, :last_name).first
      "#{top_name[0]} #{top_name[1]}"
    end

    def self.retrieve_data(to_year)
      from_year_data = BattingData
      .where(year: (to_year - 1)).where('at_bats > ?', 200)
      .pluck(:player_code, :hits, :at_bats)

      to_year_data = BattingData
      .where(year: to_year).where('at_bats > ?', 200)
      .pluck(:player_code, :hits, :at_bats)
      return from_year_data, to_year_data
    end

    def self.ensure_common_players(from_year, to_year)
      b_2010_ids = to_year.collect { |item| item[0] }
      from_year.reject! { |item| !b_2010_ids.include?(item[0]) }
    end

    def self.calc_improvements(from, to)
      result = []
      i      = 0
      for b_to in to
        hold = []
        hold << b_to[0] << calc_diff(from[i], b_to)
        result[i] = hold
        i         += 1
      end
      result
    end

    def self.calc_diff(from, to)
      to[3] - from[3]
    end

    def self.calc_avg(ary)
      ary[1].to_f / ary[2]
    end

    def self.get_averages(b)
      b.each { |r| r << calc_avg(r) }
    end

  end
end