require_relative '../spec_helper'

describe 'Fundraiser' do
  let(:user) { FactoryGirl.create(:user) }

  it 'can be created if request contains a valid token' do
    expect {
      post fundraisers_path, {
        token: user.token,
        fundraiser: {
          name: "Test",
          description: "This is a test",
          goal: 100
        }
      }
    }.to change(Fundraiser, :count).by 1

    expect( last_response.body.include?("Test")).to be_true
  end

  it 'cannot be created without a valid token' do
    post fundraisers_path, {
      token: 'wrong',
      fundraiser: {
        name: "Test",
        description: "This is a test",
        goal: 100
      }
    }

    expect( last_response.status ).to be 401
  end

  context 'that already exists' do
    let(:user) {FactoryGirl.create(:user)}
    let(:fundraiser) { FactoryGirl.create(:fundraiser) }

    it 'can be retrieved with a valid token' do
      puts fundraiser_path(fundraiser)
      get fundraiser_path(fundraiser), { token: user.token }
      expect( last_response.body.include?('test')).to be_true
    end

    it 'cannot be retrieved without a valid token' do
      get fundraiser_path(fundraiser), {token: 'wrong'}
      expect( last_response.status ).to be 401
    end
  end
end