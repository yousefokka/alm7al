class  Api::V1::ItemsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :current_category , only: [:show, :update, :destroy ,:create]

  # GET /items
  def index
    @items = current_category.items.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = current_category.items.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    @item.image.purge
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = current_category.item.find(params[:id])
    end

    def current_category
      @current_category ||= Category.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :price, :image)
    end
end
