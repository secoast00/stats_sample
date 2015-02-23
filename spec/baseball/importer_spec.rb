require 'spec_helper'

module Baseball
  class ImporterSpec

    describe Importer do
      let(:player) {
        BattingData.new player_code: '000000zz', hits: 127, at_bats: 502,
                        doubles:     30, triples: 1, home_runs: 8,
                        year_id:     2010 }

      let(:bad_player) {
        BattingData.new player_code: '000000zz', hits: 127, at_bats: 0,
                        doubles:     30, triples: 1, home_runs: 8 }

      it 'should call to import data' do
        Importer.stub(:load_players) { nil }
        Importer.stub(:load_batting_data) { nil }
        Importer.import_data.should be_nil
      end

    end
  end
end
