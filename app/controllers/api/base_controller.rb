class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

private
def authenticate_api_user!
  api_key = request.headers['HTTP_API_KEY']
  head :unauthorized unless api_key == ENV['API_KEY']
end

end
