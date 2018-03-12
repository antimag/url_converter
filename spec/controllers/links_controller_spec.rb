require "spec_helper"  

describe LinksController do
  before do
    @user = FactoryGirl.create(:user)
  end  
  describe 'POST /create' do 
    it 'should create short_url' do
      @request.headers['X-Api-Key'] = @user.api_key
      link_params = { given_url: 'https://rubygems.org/', user_id: @user.id }
      post :create, params: link_params,
                    format: :json
      expect(response.status).to eq 201
      link = response_body
      expect(link["given_url"]).to eq link_params[:given_url]
      expect(link["user_id"]).to eq @user.id
      expect(link["shorted_url"]).to match(@request.base_url)
    end
  end

  describe 'GET /show' do 
    it 'should redirect to original url' do
      @request.headers['X-Api-Key'] = @user.api_key
      link = FactoryGirl.create(:link, user_id: @user.id)
      get :show, { short_url: link.short_url }
      expect(response.status).to eq 302
      expect(response).to redirect_to link.given_url
    end

    it 'user should be unauthorized' do
      link = FactoryGirl.create(:link, user_id: @user.id)
      get :show, { short_url: link.short_url }
      expect(response.status).to eq 422
      expect(response_body["error"]).to eq "Unauthorized."
    end
  end
end