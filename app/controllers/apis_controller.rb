class ApisController < ApplicationController
  def speakers
    @speakers = Speaker.all
    respond_to do |format|
      format.json { render json: @speakers }
    end
  end

  def schedules
    @schedules = Schedule.all
    respond_to do |format|
      format.json { render json: @schedules }
    end
  end
end
