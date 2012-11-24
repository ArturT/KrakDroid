class PagesController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
    @schedules = Schedule.start_time_asc
  end
end
