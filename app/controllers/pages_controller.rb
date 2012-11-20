class PagesController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
    @schedules = Schedule.all
  end
end
