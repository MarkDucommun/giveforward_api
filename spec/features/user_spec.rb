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

    it 'receives a 401 status if invalid' do
      post get_token_users_path, {
        username: user.username,
        password: 'wrong'
      }
      
      expect(last_response.status).to be 401
    end
  end
end