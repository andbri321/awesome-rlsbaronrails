class AuthsController < ApplicationController
    def create
        hmac_secret =  ENV['hmac_secret']
        #token expira em 30 segundos
        payload = { name: params[:name] , exp: Time.now.to_i + 30}

        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: {token: token }
    end

    def index
        render json: {asd:'asd'}
    end
end
