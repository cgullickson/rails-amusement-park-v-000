class RidesController < ApplicationController
  def new
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user), flash: {notice: "#{@message}"}
  end
end
