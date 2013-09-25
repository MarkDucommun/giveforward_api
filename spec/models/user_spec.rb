require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it { should have_many(:created_fundraisers) }
  it { should have_many(:donations) }
  it { should have_many(:followed_fundraisers).through(:donations) }
  it { validate_presence_of(:username)}
end