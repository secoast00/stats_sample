require 'spec_helper'

module Baseball
  class CalcMostImprovedSpec
    describe CalcMostImproved do

      it '#do_it' do
        most_improved = CalcMostImproved.do_it(2010)
        most_improved.should eq('Ryan Zimmerman')
      end

      it '#calc_avg' do
        ary = ['aaaaa', 10, 20]
        val = CalcMostImproved.calc_avg ary
        val.should eq(0.5)
      end

      let(:from_diff) {
        ['aaaaa', 10, 20, 0.5] }
      let(:to_diff) {
        ['aaaaa', 19, 20, 0.95] }
      it '#calc_diff' do
        val = CalcMostImproved.calc_diff(from_diff, to_diff)
        val.should be_within(0.0005).of(0.450)

      end

      let(:from_common) {
        [['aaaaa', 10, 20, 0.5],
         ['bbbbb', 30, 60, 0.5],
         ['ccccc', 50, 100, 0.5]] }
      let(:to_common) {
        [['aaaaa', 19, 20, 0.95],
         ['bbbbb', 32, 60, 0.53]] }

      it '#ensure_common_players' do
        ary = CalcMostImproved.ensure_common_players(from_common, to_common)
        ary.count.should eq(2)
      end

      let(:ary) { [['aaaaa', 10, 20], ['bbbbb', 30, 60], ['ccccc', 50, 100]] }
      it '#get_avg' do

        val = CalcMostImproved.get_averages ary
        val[0][3].should eq(0.5)
      end

      let(:from) {
        [['aaaaa', 10, 20, 0.5],
         ['bbbbb', 30, 60, 0.5],
         ['ccccc', 50, 100, 0.5]] }
      let(:to) {
        [['aaaaa', 19, 20, 0.95],
         ['bbbbb', 32, 60, 0.53],
         ['ccccc', 38, 100, 0.38]] }

      it '#calc_improvements' do
        ary = CalcMostImproved.calc_improvements(from, to)
        ary[1][1].should be_within(0.0005).of(0.030)
      end

      it '#retrieve_data' do
        yr1, yr2 = CalcMostImproved.retrieve_data 2010
        yr1.should_not be_nil
        yr2.should_not be_nil
      end
    end
  end
end