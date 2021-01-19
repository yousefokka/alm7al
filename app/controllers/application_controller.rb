class ApplicationController < ActionController::API
    def current_user
        @current_user ||= User.find_by(auth_token: request.headers['Authorization']) 
      end
        
      def authenticate_with_token!
        render json: { errors: "Not authenticated" },status: :unauthorized unless user_signed_in?
      end
        
      def user_signed_in?
        current_user.present? 
      end
    
      def prepare_user
        @user = User.find(params[:id])
      end
      
      def current_category
        @current_category ||= Category.find(params[:id])
      end

      def current_type
        @current_type ||= Type.find(params[:id])
      end


end
