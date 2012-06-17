class LocationsController < ApplicationController

  def show
    @item = Item.find(params[:item_id])
    @room = @item.room
  end

end
