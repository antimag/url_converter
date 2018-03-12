Rails.application.routes.draw do
  post :generate_key, to: 'users#generate_key'
  post :create_short_url, to: 'links#create'

  get ':short_url' => 'links#show'
  
end
