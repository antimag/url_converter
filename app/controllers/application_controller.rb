class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  private

  def authenticate
    api_key = request.headers['X-Api-Key'] || params['api_key']
    @user = User.where(api_key: api_key).first if api_key
    render json: { error: "Unauthorized." }, status: :unprocessable_entity unless @user
  end
end
