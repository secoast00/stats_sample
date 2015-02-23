require_relative './spec_helper'


module Baseball

  describe Baseball do

    it 'initializes the data' do
      MemDb.stub(:initialize_data) { nil }
      MemDb.should_receive(:initialize_data)
      Baseball.initialize
    end

    describe 'statistical output' do
      let(:ary) { [['aaaaa', 10, 20], ['bbbbb', 30, 60], ['ccccc', 50, 100]] }

      it '#most_improved_batting_avg' do
        CalcMostImproved.stub(:do_it).with(2010).and_return('mary')
        most_improved = Baseball.most_improved_batting_avg(2010)
        most_improved.should eq('mary')
      end

      it '#team_glugging_percentage' do
        CalcTeamSluggers.stub(:do_it)
        Baseball.team_slugging_percentage(2012, 'WAS')
      end

      it '#triple_crown_winner' do
        Baseball.triple_crown_winner().should
        include('John Batter')
      end
    end
  end
end
