class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render :nothing => true, :status => 204, :content_type => 'text/html'
    else
      render :status => 404
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render :nothing => true, :status => 201, :content_type => 'text/html'
    else
      render :status => 404
    end
  end


private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end
