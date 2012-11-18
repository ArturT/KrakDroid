class PagesController < ApplicationController
  def index
    @speakers = Speaker.speakers
    @organizers = Speaker.organizers
  end
end
