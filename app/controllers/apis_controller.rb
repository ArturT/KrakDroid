class ApisController < ApplicationController
  def speakers
    render json: Speaker.all
  end

  def schedules
    render json: Schedule.all
  end

  def rooms
    render json: Room.all
  end
end
