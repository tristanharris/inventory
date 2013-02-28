class BookingsController < ApplicationController
  load_and_authorize_resource

  def create
    @booking.user = current_user
    @booking.status_id=1
    if @booking.save
      redirect_to params[:return_url] || @booking, notice: 'Booking was successfully created.'
    else
      redirect_to params[:return_url] || root_url, error: 'Booking could not be created.'
    end
  end

  def update
    if @booking.update_attributes(params[:booking])
      redirect_to params[:return_url] || @booking, notice: 'Booking was successfully updated.'
    else
      render action: "edit"
    end
  end

end
