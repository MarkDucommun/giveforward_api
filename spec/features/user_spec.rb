require_relative '../spec_helper'

describe 'User' do
  it 'can be created with a username and a password' do
    visit root_path

    expect {
      fill_in 'user_username', with: 'Test'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Create User'
    }.to change(User, :count).by 1

    post get_token_users_path, {
      username: 'Test',
      password: 'password'
    }

    expect(last_response.body['token']).to_not be_nil
  end

  context 'that already exists' do
    let(:user){ FactoryGirl.create(:user) }

    it 'can authenticate with username and password to recieve a token' do
      post get_token_users_path, {
        username: user.username,
        password: 'password'
      }

      expect(JSON.parse(last_response.body)['token']).to eq user.token
    end

    it 'receives a 401 status if invalid authentication request is made' do
      post get_token_users_path, {
        username: user.username,
        password: 'wrong'
      }
      
      expect(last_response.status).to be 401
    end
    
    let(:fundraiser) { FactoryGirl.create(:fundraiser) }

    it 'can retrieve owned fundraisers' do
      get owned_fundraisers_path, {token: fundraiser.owner.token}

      expect(JSON.parse(last_response.body).size).to be 1
      expect(last_response.body.include?('test')).to be_true
    end

    it 'can retrieve followed fundraisers' do
      fundraiser.donations.create(follower: user, amount: 10)
      get followed_fundraisers_path, { token: user.token }
      
      expect(JSON.parse(last_response.body).size).to be 1
      expect(last_response.body.include?('test')).to be_true
    end
  end
end