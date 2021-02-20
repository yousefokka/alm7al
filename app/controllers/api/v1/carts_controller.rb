class Api::V1::CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]
  # GET /carts
  def index
    @carts = current_order.carts.all

    render json: @carts.as_json(include: :item)
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
   @cart =  current_order.carts.create(carts_params)

   render json: @cart , status: :created

   # if @cart.save
    #  render json: @cart, status: :created
    #else
     # render json: @cart.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(carts_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = current_order.carts.find(params[:id])
    end


    def current_order
      @current_order ||= Order.find(params[:order_id])
    end

    # Only allow a trusted parameter "white list" through.
    def carts_params
      params.permit(cart: [:item_id, :qty]).require(:cart)
    end
end
 