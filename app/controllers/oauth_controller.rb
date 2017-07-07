class OauthController < ApplicationController
  before_action :create_client

  def callback
    @token = @client.auth_code.get_token(params[:code],
                                         :redirect_uri => 'http://localhost:3001/oauth/callback',
                                         :headers => {'Authorization' => 'Basic some_password'})
    # result = @token.get('http://api.upcall.dev:3000/api/v2/me').parsed
    result = @token.get('http://api.upcall.dev:3000/api/v2/campaigns').parsed
    # @token.get('http://api.upcall.dev:3000/api/dev/v1/companies/1/campaigns').parsed
    render json: result
  end

  def login_via_upcall
    redirect_to @client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3001/oauth/callback')
  end

  private

  def create_client
    @client = OAuth2::Client.new('c0b75dfda2fb78d5b657da7492754c6704d73d02cab5e27771e71d6cf4b69157',
                                 'cc97ab9db007211fbf15316a20ef09fcbea705a08de4c71d72ea669dabc44ef9',
                                 :site => 'http://www.upcall.dev:3000')
  end
end
