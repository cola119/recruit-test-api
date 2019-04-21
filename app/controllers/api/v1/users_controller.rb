class Api::V1::UsersController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate, except: [:new]
    def new
        @user = User.new(user_params)
        return response_bad_request(@user.errors.full_messages.first) unless @user.valid?
        @user.save ? response_success("Account successfully created", {"user_id": @user.user_id, "nickname": @user.user_id}) : response_internal_server_error
    end

    def show
        @user = User.find_by(user_id: params[:user_id])
        return response_not_found() if @user.nil?
        response_success("User details by user_id", @user)
    end

    def update
        @user = User.find_by(user_id: params[:user_id])
        return response_not_found() if @user.nil?
        recipe = {nickname: params[:nickname], comment: params[:comment]}
        @comp.update(user_params) ?( render status: 200, json: { message: "User successfully updated", recipe: recipe } ): response_internal_server_error
    end

    def destroy
        @user = User.find_by(user_id: params[:user_id])
        return response_not_found() if @user.nil?
        @comp.destroy
        render status: 200, json: { "message": "Account and user successfully removed" }
    end

    private
        def user_params
            params.require(:user).permit(:user_id, :password, :nickname, :comment, :token)
        end

        def authenticate
            authenticate_token || response_unauthorized
            # authenticate_or_request_with_http_token do |token, options|
            #     auth_user = User.find_by(token: token)
            #     auth_user != nil ? true : false
            # end
        end

        def authenticate_token
            authenticate_with_http_token do |token|
                Token.authenticate?(token)
            end
        end
end
