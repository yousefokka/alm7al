class Api::V1::AdminsController < ApplicationController
    before_action :authenticate_with_token!, only: [:update, :destroy]
    respond_to :json
      
    def show
     render json: @admin.as_json(only: [:email])
    end
        
    def create
        @admin = Admin.new(admin_params) 
        if @admin.save
            render json: @admin, status: 201
        else
            render json: { errors: @admin.errors }, status: 422
        end
    end
        
    def update
        if @admin.update(admin_params)
            render json: @admin, status: 200
        else
            render json: { errors: @admin.errors }, status: 422
        end
    end
      
    def destroy
        @admin.destroy
        head 204
    end
        
    private
        def admin_params
          params.require(:admin).permit(:email, :password, :password_confirmation) 
        end
    
    
end
      
