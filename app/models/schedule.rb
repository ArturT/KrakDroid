class Schedule < ActiveRecord::Base
  attr_accessible :description_en, :description_pl, :end_time, :speaker_id, :start_time, :topic_en, :topic_pl

  belongs_to :speaker

  def description
    if I18n.locale == :en
      description_en
    else
      description_pl
    end
  end

  def topic
    if I18n.locale == :en
      topic_en
    else
      topic_pl
    end
  end
end
