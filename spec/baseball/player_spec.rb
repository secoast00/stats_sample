require_relative '../spec_helper'

module Baseball
  class PlayerSpec

    describe Player do

      it 'should have this player' do

        val = Player.where(player_code: 'zaungr01').first
        val.first_name.should eq('Gregg')

      end

      it 'should not have this player id' do
        val = Player.where(player_code: 'joe').first
        val.should be_nil
      end

    end
  end
end
