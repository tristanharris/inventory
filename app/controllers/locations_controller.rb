class LocationsController < ApplicationController
  load_and_authorize_resource :item

  def show
    @room = @item.room
  end

end
