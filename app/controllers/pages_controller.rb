class PagesController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
    @schedules = Schedule.start_time_asc
    @schedule_last_updated = Schedule.last_updated
  end
end
