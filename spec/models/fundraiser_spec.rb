require 'spec_helper'

describe Fundraiser do
  it { should belong_to(:owner) }
  it { should have_many(:donations)}
  it { should have_many(:followers).through(:donations)}
end