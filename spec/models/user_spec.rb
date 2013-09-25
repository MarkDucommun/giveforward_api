require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it { should have_many(:created_fundraisers) }
end