module Baseball
  class Importer

    def self.import_data
      load_batting_data
      load_players
    end

    def self.load_players(file='../../data/Master-small.csv')
      data = File.expand_path(file, File.dirname(__FILE__))
      CSV.foreach(data, headers: true) do |row|
        next unless batting_data_exists(row[0])
        create_player(row)
      end
    end

    def self.create_player(row)
      Player.create!(
          player_code: row[0], birth_year: row[1],
          first_name:  row[2], last_name: row[3])
    end

    def self.load_batting_data(file='../../data/Batting-07-12.csv')
      data = File.expand_path(file, File.dirname(__FILE__))
      CSV.foreach(data, headers: true) do |row|
        create_data(row)
      end
    end

    def self.batting_data_exists(player_id)
      BattingData.exists?(player_code: player_id)
    end

    def self.create_data(row)
      BattingData.create!(
          player_code:  row[0], year: row[1],
          league:       row[2], team_id: row[3],
          games_played: row[4], at_bats: row[5],
          runs:         row[6], hits: row[7],
          doubles:      row[8], triples: row[9],
          home_runs:    row[10], runs_batted_in: row[11],
          stolen_bases: row[12], caught_stealing: row[13])
    end
  end
end
