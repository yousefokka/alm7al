class AllordersController < ApplicationController
    def index
        @orders = Order.all

        render json: @orders.as_json(include: {carts: {include: :item }})
       end

end
