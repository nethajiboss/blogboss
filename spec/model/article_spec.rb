require 'spec_helper'
describe Article do
   it { should belong_to(:user) }	
	 it { should have_many(:comments) }
	 it { should have_and_belong_to_many(:categories) }
end
