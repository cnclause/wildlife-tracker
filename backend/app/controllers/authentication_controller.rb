class AuthenticationController < ApplicationController
    # skip_before_action :verify_authenticity_token

    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
          else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
          end
        end
  
    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end 



  # def login
    #     @user = User.find_by_username(params[:username])

    #     if @user.authenticate(params[:password])
    #         token = JsonWebToken.encode(user_id: @user.id)
    #         time = Time.now + 24.hours.to_i
    #         render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), 
    #             username: @user.username }, status: :ok
    #     else
    #         render json: {error: "unauthorized"}, status: :unauthorized
    #     end
    # end

