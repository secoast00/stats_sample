require 'spec_helper'

module Baseball
  class CalcTeamSluggersSpec
    describe CalcTeamSluggers do

      describe '#do_it' do
        it 'should calculate all' do
          val = CalcTeamSluggers.do_it 2012, 'WAS'
          val.count.should > 1
          slug = val['zimmery01']
          slug.should be_within(0.0005).of(176.173)
        end
      end
    end
  end
end