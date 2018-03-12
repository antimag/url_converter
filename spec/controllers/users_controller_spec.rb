require "spec_helper"  

describe UsersController do  
  context 'generate api key' do
    it 'should create user with api key'do
      user_params = { name:  "Dan", email: 'dan@mailinator.com' }
      post :generate_key, params: user_params, format: :json
      expect(response.status).to eq 200
      user = response_body
      expect(user["name"]).to eq user_params[:name]
      expect(user["email"]).to eq user_params[:email]
      expect(user["api_key"]).not_to eq nil
    end

    it 'should not create user with existing email'do
      user= FactoryGirl.create(:user)
      user_params = { name:  "Test", email: user.email }
      post :generate_key, params: user_params, format: :json
      expect(response.status).to eq 400
      response = response_body
      expect(response["errors"]).to eq ["Email has already been taken"]
    end
  end
end