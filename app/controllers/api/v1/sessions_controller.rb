class Api::V1::SessionsController < ApplicationController
    respond_to :json
  
    def create 
      user_password = params[:session][:password]
      user_email = params[:session][:email]
      @user = User.find_by(email: user_email)
      
      if @user and  @user.valid_password? user_password 
        sign_in @user, store: false
        @user.generate_authentication_token! 
        @user.save
        render json: @user.as_json(methods: :user_type), status: 200
      else
        render json: { errors: "Invalid email or password" }, status: 422
      end   
    end
  
    def destroy
      @user = User.find_by(auth_token: params[:id])    
      @user.generate_authentication_token!
      @user.destroy
      head 204
    end 
  end
  