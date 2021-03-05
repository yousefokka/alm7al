class AdminsessionsController < ApplicationController
        respond_to :json
      
        def create 
          admin_password = params[:session][:password]
          admin_email = params[:session][:email]
          @admin = Admin.find_by(email: admin_email)
          
          if @admin and  @admin.valid_password? user_password 
            sign_in @admin, store: false
            @admin.save
            render json: @admin, status: 200
          else
            render json: { errors: "Invalid email or password" }, status: 422
          end   
        end      
end
