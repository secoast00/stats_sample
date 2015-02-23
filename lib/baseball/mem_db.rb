require_relative 'importer'

module Baseball
	class MemDb

    def self.initialize_data
      create_data_structure
      Importer.import_data
    end

    def self.create_data_structure
    create_db
			create_players_table
			create_stats_table
		end

		def self.create_stats_table
			ActiveRecord::Schema.define do
				create_table :batting_data do |table|
					table.column :player_code, :string
					table.column :year, :string
					table.column :league, :string
					table.column :team_id, :string
					table.column :games_played, :integer, default: 0
					table.column :at_bats, :integer, default: 0
					table.column :runs, :integer, default: 0
					table.column :hits, :integer, default: 0
					table.column :doubles, :integer, default: 0
					table.column :triples, :integer, default: 0
					table.column :home_runs, :integer, default: 0
					table.column :runs_batted_in, :integer, default: 0
					table.column :stolen_bases, :integer, default: 0
					table.column :caught_stealing, :integer, default: 0
				end
			end
		end

		def self.create_players_table
			ActiveRecord::Schema.define do
				create_table :players do |table|
					table.column :player_code, :string
					table.column :birth_year, :string
					table.column :first_name, :string
					table.column :last_name, :string
				end
			end
		end

		def self.create_db
			ActiveRecord::Base.establish_connection(
					:adapter => 'sqlite3',
					:database => ':memory:'
			)
		end
	end
end