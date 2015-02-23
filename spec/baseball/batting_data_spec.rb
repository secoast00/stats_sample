require 'spec_helper'

module Baseball
  class BattingDataSpec

    describe BattingData do

      let(:player) {
        BattingData.new player_code: '000000zz', hits: 127, at_bats: 502,
                        doubles:     30, triples: 1, home_runs: 8 }

      let(:bad_player) {
        BattingData.new player_code: '000000zz', hits: 127, at_bats: 0,
                        doubles:     30, triples: 1, home_runs: 8 }

      describe 'has some players' do
        it 'that exist' do

          val = BattingData.where(player_code: 'zaungr01').first
          val.at_bats.should eq(102)
        end

        it 'that do not' do
          val = BattingData.where(player_code: 'joe').first
          val.should eq(nil)
        end
      end

      describe 'and calculates' do

        it 'should return singles' do
          player.singles.should eq(88)
        end

        it 'should return total bases' do
          player.total_bases.should eq(95)
        end

        context '.batting_average' do
          it 'should be returned when times at_bat' do
            player.batting_average.should be_within(0.0005).of(0.253)
          end
          it 'should return 0 when no times at_bat' do
            bad_player.batting_average.should eq(0)
          end
        end

        context '.slugging_percentage' do
          it '.slugging_percentage should be returned' do
            player.slugging_percentage.should be_within(0.0005).of(0.189)
          end
          it 'should return 0 when no times at_bat' do
            bad_player.slugging_percentage.should eq(0)
          end
        end
      end
    end
  end
end
