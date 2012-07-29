class LocationsController < ApplicationController

  def show
    @item = Item.find(params[:item_id])
    authorize! :read, @item
    @room = @item.room
  end

end
