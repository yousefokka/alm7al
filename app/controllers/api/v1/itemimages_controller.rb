class Api::V1::ItemimagesController < ApplicationController
  before_action :set_itemimage, only: [:show, :update, :destroy]

  # GET /itemimages
  def index
    @itemimages = current_item.itemimage.all

    render json: @itemimages
  end

  # GET /itemimages/1
  def show
    render json: @itemimage
  end

  # POST /itemimages
  def create
    @itemimage = current_item.itemimage.save(itemimage_params)

    if @itemimage.save
      render json: @itemimage, status: :created, location: @itemimage
    else
      render json: @itemimage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /itemimages/1
  def update
    if @itemimage.update(itemimage_params)
      render json: @itemimage
    else
      render json: @itemimage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /itemimages/1
  def destroy
    @itemimage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemimage
      @itemimage = current_item.itemimage.find(params[:id])
    end

    def current_item
      @current_item ||= Item.find(params[:item_id])
    end


    # Only allow a trusted parameter "white list" through.
    def itemimage_params
      params.fetch(:image)
    end
end
