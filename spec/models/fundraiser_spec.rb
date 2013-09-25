require 'spec_helper'

describe Fundraiser do
  it { should belong_to(:owner) }
end