require 'spec_helper'

describe Donation do
  it { should belong_to(:follower) }
  it { should belong_to(:fundraiser)}
end