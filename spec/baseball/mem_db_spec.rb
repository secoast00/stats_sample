require 'spec_helper'

module Baseball
  class MemDbSpec

    describe 'creates the mem bd' do

      it 'should call to create the db' do
        MemDb.stub(:create_db) { nil }
        MemDb.stub(:create_players_table) { nil }
        MemDb.stub(:create_stats_table) { nil }
        MemDb.should_receive(:create_stats_table)
        MemDb.should_receive(:create_players_table)
        MemDb.should_receive(:create_db)

        MemDb.create_data_structure.should be_nil
      end

      it 'should call for the db creation and import of data' do
        MemDb.stub(:create_data_structure) { nil }
        Importer.stub(:import_data) { nil }
        MemDb.should_receive(:create_data_structure)
        Importer.should_receive(:import_data)

        MemDb.initialize_data
      end

    end

  end
end